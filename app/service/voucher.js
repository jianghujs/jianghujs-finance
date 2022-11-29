const Service = require('egg').Service;
const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const { subjectCategoryEnum, tableEnum } = require('../constant/constant');
const { BizError, errorInfoEnum } = require('../constant/error');

const actionDataScheme = Object.freeze({
  selectNextVoucherNumber: {
    type: 'object',
    additionalProperties: true,
    required: ['voucherName'],
    properties: {
      voucherName: { type: 'string' },
    },
  },
  createVoucherAndVoucherEntry: {
    type: 'object',
    additionalProperties: true,
    required: ['voucherEntryList', 'periodId', 'voucherAt', 'voucherName', 'voucherNumber'],
    properties: {
      voucherEntryList: { type: 'array' },
      periodId: { type: 'string' },
      voucherAt: { type: 'string' },
      voucherName: { type: 'string' },
      voucherNumber: { anyOf: [{ type: "string" }, { type: "number" }] },
    },
  },
});

class VoucherService extends Service {

  async selectNextVoucherNumber() {
    const { knex } = this.app;
    const { actionData } = this.ctx.request.body.appData
    validateUtil.validate(actionDataScheme.selectNextVoucherNumber, actionData);
    const { voucherName } = actionData;

    const maxVoucherNumberResult = await knex(tableEnum.voucher)
      .where({ voucherName })
      .max('voucherNumber', {
        as: "maxVoucherNumber",
      })
      .first();
    if (!maxVoucherNumberResult.maxVoucherNumber) {
      return { voucherNumber: 1 };
    }

    return { voucherNumber: maxVoucherNumberResult.maxVoucherNumber + 1 };
  }

  // 创建凭证和凭证条目
  async createVoucherAndVoucherEntry() {
    const { jianghuKnex, knex } = this.app
    const { username } = this.ctx.userInfo;
    const { actionData } = this.ctx.request.body.appData
    validateUtil.validate(actionDataScheme.createVoucherAndVoucherEntry, actionData);
    const { voucherEntryList, periodId, voucherAt, voucherName, voucherNumber} = actionData;

    const voucherId = `${voucherName}-${voucherNumber}`;
    const countResult = await jianghuKnex(tableEnum.voucher).where({ voucherId }).count('voucherId as count');
    if (countResult[0].count > 0) {
      throw new BizError(errorInfoEnum.voucherId_exist);
    }

    await knex.transaction(async trx => {
      await trx(tableEnum.voucher).insert({
        voucherId, voucherName, voucherNumber,
        periodId, voucherAt, voucherAccountant: username
      });

      voucherEntryList.forEach(voucherEntry => {
        voucherEntry.voucherId = voucherId;
      });
      await trx(tableEnum.voucher_entry).insert(voucherEntryList);

      // TODO: 触发更新科目余额
      for (let i = 0; i < voucherEntryList.length; i++) {
        await trx(tableEnum.subject_balance)
        .where({
          periodId,
          subjectId: voucherEntryList[i].subjectId,
        })
        .increment({
          credit: voucherEntryList[i].credit,
          debit: voucherEntryList[i].debit,
        });
      }
      

    });
  }
}

module.exports = VoucherService;