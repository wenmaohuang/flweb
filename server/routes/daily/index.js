const express = require('express')
let router = express.Router()
const dailyDB = require("../../db/daily");
router.post('/add',(req,res)=>{
    console.log(req.body,111)
    let content = req.body
    // res.send({code:666})
    
dailyDB.create('daily',content)
    .then((res)=>{
        res.send({
            code:666
            })
    }).catch(()=>{
        res.send({
            code:1
            })
    })
})


module.exports = router