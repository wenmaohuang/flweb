const express = require('express')
const articleDB = require("../../db/article");
let router = express.Router()
router.post('/send', (req, res) => {


    console.log(req.body,'re');
    console.log('iii');

    let {word} = req.body;
  let { title, type, tag, surface, content, readcount, year, month, day } = req.body;
  //后端数据验证
  if (!title || !type ||  !tag || !content || !year || !month || !day ) {
    res.send({
      code: 1,
      msg: "数据不完整",
    });
    return;
  }
  console.log(req.body,'!!');

  /*数据库存储*/
  articleDB.create(
    surface ? { title, type, tag,surface, content,  readcount , year, month, day} : {title, type,  tag, content, readcount,year, month, day }
  ).then(d => {
    res.send({
      code: 0,
      msg: "发表成功666666!!!!!"
    })
  }).catch(() => {
    res.send({
      code: 4,
      msg: "发表失败，请稍后再试"
    })
  })
})


router.post('/getShow', (req, res) => {
  let {skip, limit, tag} = req.body
  let options = tag ? {tag} : {}
console.log(req.body,'uy')

  articleDB.find({$and:[options,{pv:{$lt:1}}]}, {__v:0} ,{skip, limit,sort:{readcount:-1,date:-1}})
  .then(data => {
      res.send({
          code: 0,
          data,

      })
  })
  .catch(err => {
      res.send({
          code: 4,
          msg: '服务器错误'
      })
  }) 
})

router.post('/delete', (req, res) => {
  console.log(req.body, 'bbb')
  let title = req.body.title
  articleDB.deleteOne({ title: title })
    .then(data => {
      res.send({
        code: 'hhh'
      })
    })
    .catch(err => {
      res.send({
        code: 'err'
      })
    })

})

// router.post('/getShowTitle', (req, res) => {
//   let { skip, limit, tag } = req.body
//   let options = tag ? { tag } : {}
//   // console.log(skip, limit, tag,'test');

//   articleDB.find(options, { __v: 0 }, { skip, limit, sort: { pv: -1 } })
//     .then(data => {
//       res.send({
//         code: 0,
//         data,

//       })
//     })
//     .catch(err => {
//       res.send({
//         code: 4,
//         msg: '服务器错误'
//       })
//     })
// })

// router.post('/edit', (req, res) => {

//   let { type, title, tag, content, surface } = req.body;
//   // console.log(type, ',,,,,,');
//   // console.log(req.body,'mmm');

//   //后端数据验证
//   if (!type || !title || !tag || !content) {
//     res.send({
//       code: 1,
//       msg: "数据不完整",
//     });
//     return;
//   }

//   /*数据库存储*/
//   articleDB.updateOne(
//     surface ? { type, title, tag, content, surface } : { type, title, tag, content }
//   ).then(d => {
//     res.send({
//       code: 0,
//       msg: "发表成功666666!!!!!"
//     })
//   }).catch(() => {
//     res.send({
//       code: 4,
//       msg: "发表失败，请稍后再试"
//     })
//   })
// })

module.exports = router
