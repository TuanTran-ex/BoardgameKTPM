const {
  servGetAllProduct,
  servDeleteProduct,
  servGetProduct,
} = require('../services/product.services');
const logger = require('../utils/logger');

async function getAllProduct(req, res, next) {
  try {
    const result = await servGetAllProduct();
    res.status(200).json({
      success: true,
      message: 'Get data list products success',
      data: {
        products: result.data,
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
    const result = await servDeleteProduct(id);
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
