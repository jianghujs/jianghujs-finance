const Service = require('egg').Service;
const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const { subjectCategoryEnum, tableEnum } = require('../constant/constant');

const actionDataScheme = Object.freeze({
  createVoucherAndVoucherEntry: {
    type: 'object',
    additionalProperties: true,
    required: ['voucherEntryList', 'periodId', 'voucherCreateAt'],
    properties: {
      voucherEntryList: { type: 'array' },
      periodId: { type: 'string' },
      voucherCreateAt: { type: 'string' },
    },
  },
});

class VoucherService extends Service {

  async _buildVoucherParam() {
    const { jianghuKnex } = this.app;
    const { username } = this.ctx.userInfo;

    const voucherNumber = await idGenerateUtil.idPlus({
      knex: jianghuKnex,
      tableName: tableEnum.voucher,
      columnName: 'voucherNumber',
    });
    const voucherName = '记2022';

    return {
      voucherName,
      voucherNumber,
      voucherId: `${voucherName}${voucherNumber}`,
      voucherAccountant: username
    };
  }

  // 创建凭证和凭证条目
  async createVoucherAndVoucherEntry() {
    const { jianghuKnex } = this.app
    const { actionData } = this.ctx.request.body.appData
    validateUtil.validate(actionDataScheme.createVoucherAndVoucherEntry, actionData, '凭证生成');
    const { voucherEntryList, ...data } = actionData;

    const voucherInfo = await this._buildVoucherParam();

    const { voucherId } = voucherInfo;
    const voucherEntryPromise = [];
    voucherEntryList.forEach(item => {
      voucherEntryPromise.push(
        jianghuKnex(tableEnum.voucher_entry).insert({ ...item, voucherId })
      )
      // 创建科目余额
      voucherEntryPromise.push(
        jianghuKnex(tableEnum.subject_balance).insert({
          periodId: data.periodId,
          subjectId: item.subjectId,
          debit: item.debit,
          credit: item.credit,
        })
      )
    });
    // TODO 借贷不平衡判断

    await Promise.all([
      // 创建凭证
      jianghuKnex(tableEnum.voucher).insert({
        ...data,
        ...voucherInfo
      }),
      ...voucherEntryPromise
    ]);
  }
}

module.exports = VoucherService;