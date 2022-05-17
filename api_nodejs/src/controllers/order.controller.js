const sql = require('mssql');
const CustomError = require('../class/customError');
const query = require('../models/query');
// OrderId, createAt, username, phone(user|userAddress?), giatri
async function getAllOrder(req, res, next) {
  const { type, page, pageSize } = req.query;
  try {
    const orders = await sql.query(query.qGetAllOrder(page, pageSize, type));
    return res.status(200).json({
      success: true,
      message: 'Get data order success',
      data: {
        count: orders.recordset.length,
        orders: orders.recordset,
      },
    });
  } catch (err) {
    next(err);
  }
}

async function getOrder(req, res, next) {}

// listProduct [{productId, amount, price}]
async function addNewOrder(req, res, next) {
  const validate = voucherSchema.validate(req.body);
  if (validate.error) {
    return next(new CustomError(1, 400, 'Data voucher not valid'));
  } else {
    const { voucherId, userId, userAddressId, ship, value, listProduct } =
      req.body;
    try {
      // Ktra voucher co hop le ko
      const voucher = await sql.query(query.qFindVoucherById(id));
      if (voucher.recordset.length == 0)
        return next(new CustomError(6, 400, 'Voucher not exists'));
      if (
        voucher.recordset[0].Amount <= 0 ||
        Date.parse(voucher.recordset[0].Expired) < Date.now()
      ) {
        return next(new CustomError(6, 400, 'Voucher is not invalid'));
      }
      const checkVoucher = await sql.query(
        query.qCheckVoucherUserUsed(userId, voucherId)
      );
      if (checkVoucher.recordset.length > 0) {
        return next(new CustomError(6, 400, 'Voucher is not invalid'));
      }
      const newOrder = await sql.query(
        query.qAddOrder(voucherId, userId, userAddressId, ship, value)
      );
      const newOrderId = newOrder.recordset[0].ID;
      listProduct.forEach(async (item) => {
        await sql.query(
          query.qAddOrderDetail(
            newOrderId,
            item.Id,
            item.productPriceId,
            item.quantity
          )
        );
      });
      res.status(200).json({
        success: true,
        message: 'Add order success',
      });
    } catch (err) {
      next(err);
    }
  }
}

async function confirmOrder(req, res, next) {
  const { id } = req.params;
  try {
    const order = await sql.query(query.qGetOrderNotConfirm(id));
    if (order.recordset.length <= 0)
      return next(new CustomError(1, 400, 'Order not valid to confirm'));
    await sql.query(query.qConfirmOrder(id));
    return res.status(200).json({
      success: true,
      message: 'Confirm Order success',
    });
  } catch (err) {
    next(err);
  }
}
module.exports = { getAllOrder, addNewOrder, confirmOrder };
