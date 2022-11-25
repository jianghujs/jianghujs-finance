const Service = require('egg').Service;
const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const { subjectCategoryEnum } = require('../constant/constant');

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

class VoucherService extends Service {
  async fillInsertItemParamsBeforeHook() {
    const { jianghuKnex } = this.app
    const actionData = this.ctx.request.body.appData.actionData;
    const { userId, username } = this.ctx.userInfo;

    const voucherNumber = await idGenerateUtil.idPlus({
      knex: jianghuKnex,
      tableName: 'voucher',
      columnName: 'voucherNumber',
    });
    const voucherName = '记2022'

    this.ctx.request.body.appData.actionData = {
      ...actionData,
      voucherName,
      voucherNumber,
      voucherId: `${voucherName}${voucherNumber}`,
      voucherAccountant: username
    };
  }

  // 创建凭证和凭证条目
  async createVoucherAndVoucherEntry() {
    
  }
}

module.exports = VoucherService;