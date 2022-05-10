const express = require('express');
const {} = require('../controllers/');

const router = express.Router();

router.get('/', getAllUser);
router.patch('/:id', updateUser);

module.exports = router;
