const Service = require('egg').Service;
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const { tableEnum } = require('../constant/constant');

const actionDataScheme = Object.freeze({
  checkout: {
    type: 'object',
    additionalProperties: true,
    required: ['periodId'],
    properties: {
        periodId: { anyOf: [{ type: "string" }, { type: "number" }] },
    },
  },

  createPeriodStart: {
    type: 'object',
    additionalProperties: true,
    required: ['periodId'],
    properties: {
        periodId: { anyOf: [{ type: "string" }, { type: "number" }] },
    },
  },
});

class PeriodService extends Service {

  async createPeriodStart() {
    const ctx = this.ctx;
    const { jianghuKnex } = this.app;
    const actionData = this.ctx.request.body.appData.actionData;
    validateUtil.validate(actionDataScheme.createPeriodStart, actionData);
    const { periodId } = actionData;
    const isPeriodStart = '是';
    const isCheckout = '待结账';

    const subjectList = await jianghuKnex(tableEnum.subject).where({}).select();
    const subjectBalanceList = subjectList.map(subject => {
      return {
        periodId,
        subjectId: subject.subjectId,
        debit: 0, credit: 0,
        occurDebit: 0, occurCredit: 0, occurAmount: 0,
        isPeriodStart,
      }
    })

    await jianghuKnex.transaction(async trx => {
        await trx(tableEnum.period, ctx).insert({ periodId, isCheckout, isPeriodStart });
        await trx(tableEnum.subject_balance, ctx).insert(subjectBalanceList);
    })

  }

  async checkout() {
    const ctx = this.ctx;
    const { jianghuKnex } = this.app;
    const actionData = this.ctx.request.body.appData.actionData;
    validateUtil.validate(actionDataScheme.checkout, actionData);
    const { periodId } = actionData;

    await jianghuKnex.transaction(async trx => {

        await trx(tableEnum.period, ctx).update({ isCheckout: '已结账' });

        await trx(tableEnum.period, ctx).insert({ periodId, isCheckout: '待结账' });

        // TODO: 生成下一个科目余额
    })

  }


  async reCheckoutAllPeriod() {
    const ctx = this.ctx;
    const { jianghuKnex } = this.app;
  }

  

}

module.exports = PeriodService;