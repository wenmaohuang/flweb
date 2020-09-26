var express = require('express');
var router = express.Router();

/* GET home page. */





router.use('/upload',require('./upload/index.js'))
router.use('/article',require('./article/index.js'))
router.use('/daily',require('./daily/index.js'))
router.use('/search',require('./search/index.js'))
module.exports = router;
