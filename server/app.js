var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');




var mongoose = require('mongoose')

var app = express();





// mongoose.connect("mongodb://localhost:27017/blog",{ useNewUrlParser: true, useUnifiedTopology: true })
//     .then(()=>{console.log("数据库连接成功")})
//     .catch(()=>{console.log("数据库连接失败")});


// view engine setup



app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '../build/web')));
// app.use(express.static(path.join(__dirname, '../build/web')));
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

// const routesList = [
//     {
//         path: '/',
//         name: 'admin',
//     },
//     {
//         path: '',
//         name: 'adminIndex',
//     },
//     {
//         path: '/articleAdd',
//                 name: 'Add',
//     },
//     {
//         path: '/articleManager',
//                 name: 'Manager',
//     },
//     {
//         path: '/login',
//         name: 'login',
//     }
// ]
// routesList.forEach(item=>{
// app.get(item.path,(req,res)=>{
//     res.sendFile(require('path').join(__dirname,'../client/dist/index.html'))
// })
// })






module.exports = app;
