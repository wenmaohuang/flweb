import 'package:flutter/material.dart';
class ArticleHot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      margin: EdgeInsets.only(top: 20),

      color: Colors.lightGreen,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround,


        children: [
          Container(
            padding: EdgeInsets.only(right: 40,bottom: 30,top: 10),
            decoration: BoxDecoration(
              // color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ))),
            width: 300,
            child: Text(
              '热门文章',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.only(bottom: 10,),

            child: Row(
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 40, top: 40),
//设置 child 居中


                  alignment: Alignment(0, 0),
                  height: 20,
                  width: 20,
//边框设置
                  decoration: new BoxDecoration(
//背景
                    color: Colors.pinkAccent,
                    //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    //设置四周边框
                    // border: new Border.all(width: 1, color: Colors.red),
                  ),
                  // child: Text("Container 的圆角边框"),
                ),
                Text(
                  'title',
                  style: TextStyle(
                    // fontSize: 20

                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
