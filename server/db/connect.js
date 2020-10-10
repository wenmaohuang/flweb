const mongoose = require("mongoose")
mongoose.connect(
    'mongodb://localhost:27017/flweb',
    {useNewUrlParser: true, useUnifiedTopology: true})
    .then(() => {
        console.log("连接成功")
    })
    .catch(() => {
        console.log('连接失败');
    })

module.exports = mongoose


