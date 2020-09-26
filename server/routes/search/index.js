// const express = require('express')
// let router = express.Router()

var express = require('express')
var router = express.Router()
const request = require('request')

// console.log(request,'eee');

router.post("/",(req,res)=>{
 

    console.log(req.body,'re');
     console.log('iii');

    let {word} = req.body;
//    console.log(word,'a1');
    if (word){
        request.get(
            'https://www.baidu.com/sugrec?prod=pc&wd='+ encodeURI(word)+'&cb=lyj'
            ,(err,a,body)=>{
                console.log(err,'c1');
                if (err){
                    res.send([]);
                    return;
                }
                console.log(body,'b1');
                let str = body.match(/^[\da-z_]+\((.+)\)$/i)[1];
                str = JSON.parse(str);
                if (str.g){
                    /*let dataArr = [];
                    str.g.forEach(item=>{
                        dataArr.push(item.q);
                    });*/
                    console.log(str.g,'bbb');
                    res.send(
                        str.g.map(item=>item.q)
                    );
                }else{
                    res.send([]);
                }
            }
        );
    }else{
        res.send([]);
    }
});
router.get('/focus',(req,res)=>{
    
})

// module.exports = router
module.exports = router
