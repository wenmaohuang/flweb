const mongoose = require("./connect")
// const dailyDB = require('./daily')

let Schema = mongoose.Schema;
let dailySchema = new Schema({
  content : {type: String,required: true},
  time: {type:String,require: true}
})
let daily = mongoose.model("daily",dailySchema);

module.exports = daily
