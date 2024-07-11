var express = require('express');
var app = express();

var indexRouter = require('./home');
var usersRouter = require('./users');
var filemanRouter = require('./fileman');
var catalogRouter = require('./catalog');
var cashierRouter = require('./cashier');


app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/fileman', filemanRouter);
app.use('/catalog', catalogRouter);
app.use('/cashier', cashierRouter);
