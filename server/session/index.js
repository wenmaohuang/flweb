const session = require('express-session')
const sessionMongo = require('connect-mongo')(session)

module.exports = session({
    secret:'afei',
    cookie:{maxAge:10*60*1000},
    rolling:true,
    resave:false,
    saveUninitialized:false,
    store: new sessionMongo({
        url:"mongodb://localhost:27017/test"
    })

})