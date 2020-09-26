

const express = require("express");
const path = require("path");
const multer = require("multer");



let router = express.Router();
let storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, "../../public/img/upload/article"));

  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});
let upload = multer({ storage }).single('file');

console.log('a')

router.post("/articleSurface", (req, res)=> {
    console.log('b')
    // console.log(req)

  upload(req, res, function (err) {

      console.log(req.file, 2222);
    if (err instanceof multer.MulterError) {
        // A Multer error occurred when uploading.
        res.send('multer err')
    } else if (err) {
        res.send('unknown err')
      // An unknown error occurred when uploading.
    }else{
        // res.sendStatus('is ok');
        res.send({
            code:0,
            msg:'',
            surface:'http://www.fyyd.vip:3002/img/upload/article/'+req.file.filename
        })
        console.log('c')
    }


      

    // Everything went fine.

  });
});

module.exports = router;
