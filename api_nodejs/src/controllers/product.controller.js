const sql = require('mssql');
const {
  servGetAllProduct,
  servDeleteProduct,
  servGetProduct,
} = require('../services/product.services');
const query = require('../models/query');
const logger = require('../utils/logger');

// List Product(mainImg, subScr, name, price), countAll
async function getAllProduct(req, res, next) {
  const { category, filter, key, page, pageSize } = req.query;
  try {
    const listProduct = await sql.query(
      query.qGetAllProduct(category, filter, key, page, pageSize)
    );
    let totalCount;
    if (key) totalCount = listProduct.recordset.length;
    else {
      const resCount = await sql.query(query.qCountProduct(category));
      if (resCount.recordset.length > 0)
        totalCount = resCount.recordset[0].CountProduct;
      else totalCount = 0;
    }
    res.status(200).json({
      success: true,
      message: 'Get all product success',
      data: {
        count: totalCount,
        products: listProduct.recordset,
      },
    });
  } catch (err) {
    next(err);
  }
}
async function getProduct(req, res, next) {
  const { id } = req.params;
  try {
    const result = await servGetProduct(id);
    res.status(200).json({
      success: true,
      message: 'Get data product success',
      data: {
        products: result.data,
      },
    });
  } catch (err) {
    next(err);
  }
}

async function addProduct() {}

async function deleteProduct(req, res, next) {
  const { id } = req.params;
  try {
    // console.log(result);
    res.status(200).json({
      success: true,
      message: 'Success delete product',
    });
  } catch (err) {
    next(err);
  }
}

module.exports = { getAllProduct, getProduct, addProduct, deleteProduct };
