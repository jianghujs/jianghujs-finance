const Service = require('egg').Service;
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const { tableEnum } = require('../constant/constant');

const actionDataScheme = Object.freeze({
  checkout: {
    type: 'object',
    additionalProperties: true,
    required: ['periodId'],
    properties: {
        periodId: { type: 'string' },
    },
  },
});

class PeriodService extends Service {

  async checkout() {
    const ctx = this.ctx;
    const { jianghuKnex } = this.app;
    const actionData = this.ctx.request.body.appData.actionData;
    validateUtil.validate(actionDataScheme.checkout, actionData);
    const { periodId } = actionData;

    await jianghuKnex.transaction(async trx => {

        await trx(tableEnum.period, ctx).update({ isCheckout: '已结算' });

        await trx(tableEnum.period, ctx).insert({ periodId, isCheckout: '待结算' });

        // TODO: 生成下一个科目余额
    })

  }

}

module.exports = PeriodService;