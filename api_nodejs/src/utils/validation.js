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

module.exports = { signInSchema, signUpSchema };
