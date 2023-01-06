'use strict';

class BizError extends Error {
  constructor({ errorCode, errorReason, errorReasonSupplement }) {
    super(JSON.stringify({ errorCode, errorReason, errorReasonSupplement }));
    this.name = 'BizError';
    this.errorCode = errorCode;
    this.errorReason = errorReason;
    this.errorReasonSupplement = errorReasonSupplement;
  }
}

const errorInfoEnum = Object.freeze({
  data_expection: {
    errorCode: "data_expection",
    errorReason: "数据异常",
  },
  period_not_exist: {
    errorCode: "period_not_exist",
    errorReason: "会计期间不存在",
  },
  period_has_checkout: {
    errorCode: "period_has_checkout",
    errorReason: "会计期间已结算",
  },
  voucherId_exist: {
    errorCode: "voucherId_exist",
    errorReason: "凭证字号已存在",
  },
});

module.exports = {
  BizError,
  errorInfoEnum,
};
