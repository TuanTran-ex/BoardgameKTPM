const sql = require('mssql');
const CustomError = require('../class/customError');
const query = require('../models/query');
const logger = require('../utils/logger');

exports.getAllUser = async (req, res, next) => {
  try {
    const listUser = await sql.query(query.qFindAllUser());
    res.status(200).json({
      success: true,
      message: 'Success get all user info',
      data: { count: listUser.recordset.length, users: listUser.recordset },
    });
  } catch (err) {
    next(err);
  }
};

exports.updateUser = async (req, res, next) => {
  const { isLock } = req.body;
  const { id } = req.params;
  const user = await sql.query(query.qFindUserById(id));
  if (user.recordset.length == 0)
    next(new CustomError(6, 400, 'User not exists'));
  if (isLock) {
    const result = await sql.query(query.qLockUser(id));
    logger.info(result);
    return res.json({ data: result });
  } else {
    const { fullName, phone, dob, gender, email, avatar, address } = req.body;
    const result = await sql.query(
      query.qUpdateUser(fullName, phone, dob, gender, email, avatar, address)
    );
    logger.info(result);
    return res.json({ data: result });
  }
};
