const Service = require('egg').Service;
const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const { subjectCategoryEnum, tableEnum } = require('../constant/constant');

const actionDataScheme = Object.freeze({
  fillInsertItemParamsBeforeHook: {
    type: 'object',
    additionalProperties: true,
    required: [ 'subjectCategory'],
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
    switch(subjectCategory) {
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
      subjectId =  parseInt(maxBizIdResult.maxBizId) + 1;
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
    const { rows } = this.ctx.response.body.appData.resultData;
    const { periodId } = this.ctx.request.body.appData.where;

    const total = {}
    const current = {}
    rows.forEach(item=> {
      // 计算本期
      if (!current[item.subjectId]) {
        current[item.subjectId] = 0
      }
      if (item.periodId == periodId) {
        // current[item.subjectId].debit += item.debit
        // current[item.subjectId].credit += item.credit
        current[item.subjectId] += (item.debit - item.credit)
      }

      // 计算本年
      if (!total[item.subjectId]) {
        total[item.subjectId] = 0
      }
      // total[item.subjectId].debit += item.debit
      // total[item.subjectId].credit += item.credit
      total[item.subjectId] += (item.debit - item.credit)
    })

    this.ctx.response.body.appData.resultData = {
      ...this.ctx.response.body.appData.resultData,
      subjectTotalBalance: total,
      subjectCurrentPeriodBalance: current
    }
  }

}

module.exports = SubjectService;