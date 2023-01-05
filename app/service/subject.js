const Service = require('egg').Service;
const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const { subjectCategoryEnum, tableEnum } = require('../constant/constant');

const actionDataScheme = Object.freeze({
  fillInsertItemParamsBeforeHook: {
    type: 'object',
    additionalProperties: true,
    required: ['subjectCategory'],
    properties: {
      subjectCategory: { type: 'string' },
    },
  },
});

class SubjectService extends Service {
  async fillInsertItemParamsBeforeHook() {
    const { jianghuKnex } = this.app
    const actionData = this.ctx.request.body.appData.actionData;
    // validateUtil.validate(actionData, "科目生成");

    const { subjectCategory } = actionData

    let startValue = 1000
    switch (subjectCategory) {
      case subjectCategoryEnum.zhican:
        startValue = 1000;
        break;
      case subjectCategoryEnum.fuzai:
        startValue = 2000;
        break;
      case subjectCategoryEnum.quanyi:
        startValue = 3000;
        break;
      case subjectCategoryEnum.chengben:
        startValue = 4000;
        break;
      case subjectCategoryEnum.sunyi:
        startValue = 5000;
        break;
      default:
        break;
    }

    const maxBizIdResult = await jianghuKnex(tableEnum.subject)
      .where({ subjectCategory })
      .max('subjectId', {
        as: "maxBizId",
      })
      .first();

    let subjectId = null
    if (!maxBizIdResult.maxBizId) {
      subjectId = startValue;
    } else {
      subjectId = parseInt(maxBizIdResult.maxBizId) + 1;
    }


    this.ctx.request.body.appData.actionData.subjectId = subjectId;
  }
  async addPeriodStartBalance() {
    const { jianghuKnex } = this.app
    const { actionData } = this.ctx.request.body.appData;
    // 创建期初科目余额
    const { subjectId } = actionData

    // TODO 会计期间怎么获取？期初余额怎么设置
    await jianghuKnex(tableEnum.subject_balance)
      .insert({
        subjectId,
        isPeriodStart: '是',
      });

  }

  /**
   * 计算科目总账余额
   * 期初，本期，期末
   */

  async countSubjectGeneralLedger() {
    const { jianghuKnex } = this.app
    const rows = await jianghuKnex(tableEnum.view01_subject_balance).select();
    const { periodId } = this.ctx.request.body.appData.where;

    const total = {}
    const current = {}
    rows.forEach(item => {
      // 计算本期
      if (!current[item.subjectId]) {
        item.currentPeriodBalance = 0
      }
      if (item.periodId == periodId) {
        item.currentPeriodBalance += (item.debit - item.credit)
      }

      // 计算本年
      if (!total[item.subjectId]) {
        item.totalBalance = 0
      }
      item.totalBalance += (item.debit - item.credit)
    })

    this.ctx.response.body.appData.resultData = {
      rows: rows.filter(item=> item.periodId == periodId)
    }
  }

  /**
   * 重新计算科目余额
   * 1. 取所有会计期间，每个期间生成所有科目的数据
   * 2. 取所有科目余额表，遍历
   * 3. 根据科目id，和对应会计期间查对应的凭证，并进行借方和贷方++操作
   * 
   */
  async countSubjectBalance() {
    const { jianghuKnex, knex } = this.app;
    const periodList = await jianghuKnex(tableEnum.period).select();
    const subjectList = await jianghuKnex(tableEnum.subject).select();
    const subjectBalanceList = await jianghuKnex(tableEnum.subject_balance).select();

    // 生成科目余额
    const allSubjectBalanceList = [];
    for (let i = 0; i < periodList.length; i++) {
      const period = periodList[i];
      const periodSubjectBalanceList = subjectList.map(s => {
        return { periodId: period.periodId, subjectId: s.subjectId, debit:0, credit: 0 }
      })
      allSubjectBalanceList.push(...periodSubjectBalanceList);
    }
    const waittingCreateSubjectBalanceList = allSubjectBalanceList
      .filter(sb => subjectBalanceList.findIndex(item => item.periodId === sb.periodId && item.subjectId === sb.subjectId) === -1)
    if (waittingCreateSubjectBalanceList.length > 0) {
      await jianghuKnex(tableEnum.subject_balance, this.ctx).insert(waittingCreateSubjectBalanceList)
    }

    // 计算科目余额

    // for (let i = 0; i < periodList.length; i++) {
    //   for (let j = 0; j < subjectList.length; j++) {
    //     const periodItem = periodList[i]
    //     const subjectItem = subjectList[j]

    //     // 先查查有没有对应科目余额
    //     const firstSubjectBalance = await jianghuKnex(tableEnum.subject_balance)
    //       .where({
    //         periodId: periodItem.periodId,
    //         subjectId: subjectItem.subjectId,
    //       })
    //       .select()
    //       .first()

    //     if (!firstSubjectBalance) {
    //       await jianghuKnex(tableEnum.subject_balance, this.ctx).insert({
    //         periodId: periodItem.periodId,
    //         subjectId: subjectItem.subjectId,
    //       })
    //     } else {
          
    //     }

    //     const voucherEntryList = await jianghuKnex(tableEnum.view01_voucher_entry).where({
    //       periodId: periodItem.periodId,
    //       subjectId: subjectItem.subjectId,
    //     })
    //       .select()

    //     const debit = voucherEntryList.reduce((prev, next) => prev + next.debit, 0)
    //     const credit = voucherEntryList.reduce((prev, next) => prev + next.credit, 0)

    //     await jianghuKnex(tableEnum.subject_balance, this.ctx)
    //       .where({
    //         periodId: periodItem.periodId,
    //         subjectId: subjectItem.subjectId,
    //       })
    //       .update({
    //         debit,
    //         credit,
    //       })
    //   }
    // }
  }

  /**
   * 资产负债期末数计算
   * 1. 取出资产负债列表
   * 2. 取对应的公式，遍历其科目的凭证，进行公式符号的计算
   * 3. 在资产负债项中加入计算后期末数
   * 
   * TODO 应该用mysql来做，这样性能太差
   */
  // async countAssetAndLiabilityAfterHook() {
  //   const { jianghuKnex, knex } = this.app

  //   const { rows } = this.ctx.response.body.appData.resultData;

  //   const [formulaList, entryList] = await Promise.all([
  //     jianghuKnex(tableEnum.profit_formula).select(),
  //     jianghuKnex(tableEnum.subject_balance).select(),
  //   ])
   
  

  //   for (let i=0; i < rows.length; i++) {
  //     const item = rows[i]
  //     const currentFormulaList = formulaList.filter(formulaItem=> formulaItem.balanceSheetId == item.balanceSheetId)

  //     item.endOfTermBalance = 0
      
  //     for (let j=0; j < currentFormulaList.length; j++) {
  //       const entry = entryList.filter(entryItem=> currentFormulaList[j].subjectId == entryItem.subjectId)[0]
  //       if (entry) {
  //         item.endOfTermBalance += (entry.debit - entry.credit)
  //       }

  //     }
  //   }

  //   this.ctx.request.body.appData.resultData = {
  //     rows
  //   }
  // }

  async updateSubjectBalanceListForPeriodIdFirst() {
  }
}

module.exports = SubjectService;