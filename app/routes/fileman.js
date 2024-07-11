var express = require('express');
var cors = require('cors')
var fileman = require('../controllers/fileman')
var db = require('../controllers/insert.db')
var router = express.Router();



var app = express();

/* GET home page. */
router.get('/', fileman.home);

/* GET API */
router.get('/api', fileman.api);
router.post('/insert', db.inserts.datasheet);

/* GET Rename A file */

router.post('/rename',  fileman.rename);

router.post('/move',  fileman.move);


module.exports = router;
