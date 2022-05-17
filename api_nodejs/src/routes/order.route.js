const express = require('express');
const { checkAdmin } = require('../middlewares/authorization');

const {
  getAllOrder,
  addNewOrder,
  confirmOrder,
} = require('../controllers/order.controller');

const router = express.Router();

router.get('/', checkAdmin, getAllOrder);
router.post('/', addNewOrder);
router.patch('/:id', checkAdmin, confirmOrder);
module.exports = router;
