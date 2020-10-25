var express = require('express');
var router = express.Router();

/* GET home page. */





router.use('/flweb/upload',require('./upload/index.js'))
router.use('/flweb/article',require('./article/index.js'))
router.use('/flweb/daily',require('./daily/index.js'))
router.use('/flweb/search',require('./search/index.js'))
module.exports = router;
