const sql = require('mssql');
const CustomError = require('../class/customError');
const query = require('../models/query');
const logger = require('../utils/logger');

exports.getAllUser = async (req, res, next) => {
  const { page, pageSize } = req.body;
  try {
    const listUser = await sql.query(query.qFindAllUser(page, pageSize));
    res.status(200).json({
      success: true,
      message: 'Success get all user info',
      data: { count: listUser.recordset.length, users: listUser.recordset },
    });
  } catch (err) {
    next(err);
  }
};

exports.getUser = async (req, res, next) => {
  const { id } = req.params;
  try {
    const user = await sql.query(query.qFindUserById(id));
    if (user.recordset.length == 0)
      next(new CustomError(6, 400, 'User not exists'));
    const listAddress = await sql.query(query.qFindListAddrByUserId(id));
    const resData = {
      ...user.recordset[0],
      listAddress: listAddress.recordset,
    };
    delete resData['Password'];
    delete resData['Role'];
    delete resData['IsDelete'];
    delete resData['isLock'];
    delete resData['CreatedBy'];
    delete resData['UpdatedBy'];
    res
      .status(200)
      .json({ success: true, message: 'Get data user success', data: resData });
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
    return res.json({ data: result });
  } else {
    const { fullName, phone, dob, gender, email, avatar, address } = req.body;
    const result = await sql.query(
      query.qUpdateUser(fullName, phone, dob, gender, email, avatar, address)
    );
    return res.json({ data: result });
  }
};
