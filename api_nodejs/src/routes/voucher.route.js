const express = require('express');
const {
  getAllVoucher,
  getVoucher,
  addVoucher,
  updateVoucher,
  deleteVoucher,
} = require('../controllers/voucher.controller');
const { checkAdmin } = require('../middlewares/authorization');
const router = express.Router();

router.get('/', checkAdmin, getAllVoucher);
router.get('/:id', getVoucher);
router.post('/', checkAdmin, addVoucher);
router.patch('/:id', checkAdmin, updateVoucher);
router.delete('/:id', checkAdmin, deleteVoucher);

module.exports = router;
