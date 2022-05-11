const joi = require('joi');

const signUpSchema = joi.object({
  username: joi.string().min(4).max(50).required(),
  email: joi.string().email().required(),
  password: joi.string().pattern(new RegExp('^[a-zA-Z0-9]{3,30}$')).required(),
});

const signInSchema = joi.object({
  username: joi.string().min(4).max(50).required(),
  password: joi.string().pattern(new RegExp('^[a-zA-Z0-9]{3,30}$')).required(),
});

const voucherSchema = joi.object({
  code: joi.string().max(250).required(),
  expired: joi.string().required(),
  amount: joi.number().required(),
  value: joi.number().required(),
  status: joi.number().valid(9, 1),
  type: joi.number().valid(0, 1),
});
const voucherUpdateSchema = joi.object({
  code: joi.string().max(250),
  expired: joi.string(),
  amount: joi.number(),
  value: joi.number(),
  status: joi.number().valid(9, 1),
  type: joi.number().valid(0, 1),
});

module.exports = {
  signInSchema,
  signUpSchema,
  voucherSchema,
  voucherUpdateSchema,
};
