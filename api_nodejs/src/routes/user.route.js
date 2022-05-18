const express = require('express');
const multer = require('multer');
const { checkAdmin } = require('../middlewares/authorization');
const {
  getAllUser,
  getUser,
  updateUser,
  getOrderOfUser,
} = require('../controllers/user.controller');
const upload = multer({ dest: 'public/upload/avatar' });
const router = express.Router();

router.get('/', checkAdmin, getAllUser);
router.get('/:id', getUser);
router.get('/:id/orders', getOrderOfUser);
router.patch('/:id', upload.single('avatar'), updateUser);

module.exports = router;
