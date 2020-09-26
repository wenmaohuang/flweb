const express = require('express')
let router = express.Router()
const dailyDB = require("../../db/daily");

dailyDB.deleteMany({}).then(data=>{
console.log(data)
}).catch(()=>{

})

