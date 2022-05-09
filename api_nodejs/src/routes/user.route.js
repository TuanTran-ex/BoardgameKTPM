const express = require('express');
const { getAllUser, updateUser } = require('../controllers/user.controller');

const router = express.Router();

router.get('/', getAllUser);
router.patch('/:id', updateUser);

module.exports = router;
