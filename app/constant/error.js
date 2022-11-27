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
  voucherId_exist: {
    errorCode: "voucherId_exist",
    errorReason: "凭证字号已存在",
  },
});

module.exports = {
  BizError,
  errorInfoEnum,
};
