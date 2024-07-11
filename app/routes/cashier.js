var express = require('express');
var router = express.Router();

/* GET cashier home page. */
router.get('/', function(req, res, next) {
  res.render('cashier', { title: 'CASHIER @ DATASHEET' });
});

module.exports = router;