const express = require('express');
const { checkAdmin } = require('../middlewares/authorization');
const {
  getAllUser,
  getUser,
  updateUser,
  getOrderOfUser,
} = require('../controllers/user.controller');

const router = express.Router();

router.get('/', checkAdmin, getAllUser);
router.get('/:id', getUser);
router.get('/:id/orders', getOrderOfUser);
router.patch('/:id', checkAdmin, updateUser);

module.exports = router;
