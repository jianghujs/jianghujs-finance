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

    const maxBizIdResult = await jianghuKnex('subject')
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
}

module.exports = SubjectService;