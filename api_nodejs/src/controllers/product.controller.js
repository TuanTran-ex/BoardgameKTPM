const sql = require('mssql');
const {
  servGetAllProduct,
  servDeleteProduct,
  servGetProduct,
} = require('../services/product.services');
const query = require('../models/query');
const logger = require('../utils/logger');
const CustomError = require('../class/customError');

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

//list image, đánh giá, số lượng tối đa,
async function getProduct(req, res, next) {
  const { id } = req.params;
  try {
    const product = await sql.query(query.qGetProductById(id));
    if (product.recordset.length == 0)
      return next(new CustomError(6, 400, 'Product is not exists'));
    const listProductImage = await sql.query(query.qGetProductImage(id));
    const listFeedback = await sql.query(query.qGetAllFeedbackProduct(id));
    console.log(product.recordset[0]);
    const resData = {
      ...product.recordset[0],
      images: listProductImage.recordset,
      feedback: listFeedback.recordset,
    };
    if (listFeedback.recordset.length > 0) {
      for (let i = 0; i < listFeedback.recordset.length; i++) {
        const feedbackImages = await sql.query(
          query.qGetFeedbackImage(listFeedback.recordset[i].Id)
        );
        resData.feedback[i].images = feedbackImages.recordset;
      }
    }
    return res.status(200).json({
      success: true,
      message: 'Get data product success',
      data: { product: resData },
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
