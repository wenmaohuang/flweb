var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var mongoose = require('mongoose')
var app = express();
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '../build/web')));
app.use(express.static(path.join(__dirname, 'public')));
app.get('*', function (request, response){
    response.sendFile(path.resolve(__dirname, '../build/web', 'index.html'))
})
app.use((req, res, next) => {
    res.header({
        'Access-Control-Allow-Credentials': true,
        'Access-Control-Allow-Origin': req.headers.origin || '*',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'PUT,POST,GET,DELETE,OPTIONS',

        // "Content-Security-Policy": "upgrade-insecure-requests"
        // 'Content-Type': 'application/json; charset=utf-8'
    });
    if (req.method === "OPTIONS") {
        res.sendStatus(200);
    } else {
        next();
    }
});


app.use(require('./session/index.js'))
app.use('/', require('./routes/index.js'))
module.exports = app;
