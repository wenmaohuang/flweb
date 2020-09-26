import 'package:flutter/material.dart';
import 'package:flweb/HomeContent.dart';
// import 'package:flweb/GetUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(new MyApp());
class MyApp extends StatefulWidget {
  MyApp({Key key, this.data, this.title}) : super(key: key);
  final data;
  final title;
  @override
  _PageState createState() => _PageState();
}
class _PageState extends State<MyApp> {
  var array = [];
  var obj={};
  final myController = TextEditingController();
  fetchPost() async {
    try {
      final response = await Dio().post('http://www.fyyd.vip:3004/search',
          data:{'word':myController.text}
      );
      print(1);
      print(response.data);
      var data = response.data;
      setState(() {
        array = data;
      });
      print(2);
    } catch (e) {
      print(e);
    }
  }


  Widget buildGrid() {
    List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for(var item in array) {
      tiles.add(

          new Row(

              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    var url = 'http://www.baidu.com/s?wd=${item}';
                    launch(url);
                  },
                  child: Text(item),
                ),
                // new Text(item)

              ]
          )

      );
    }
    content = new Column(
        children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
      //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );
    return content;
  }
  // Widget ExampleWidget = buildGrid();


  @override
  void initState() {
    //页面初始化
    super.initState();
  }
  @override
  void dispose() {
    //页面销毁时
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print(obj);//将会输出两次
    print(array);//将会输出两次
    return new MaterialApp(
        home: new Scaffold(
            body: Container(
              // padding: new EdgeInsets.only(top: 300),

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/4.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(




                  child: Column(


                    children: <Widget>[
                      PhysicalModel (

                        color: Colors.blue,
                        elevation: 6,
                        child: Container(
                          padding: new EdgeInsets.only(top: 50,left: 40, right: 40, bottom: 19),
                          child: Container(
                            height: 40.0,
                            padding: new EdgeInsets.only(left: 10),
                            decoration: new BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: new BorderRadius.circular(25.0),

                            ),
                            child: TextFormField(
                              style: new TextStyle(color: Colors.white70,fontSize: 14),//输入文字颜色和大小
                              controller: myController,
                              onChanged: (String val) {
                                fetchPost();
                              },
                              decoration: InputDecoration(
                                hintText: '请输入关键字搜索',//文字提示
                                hintStyle: new TextStyle(color: Colors.white70),//提示文字颜色
                                icon: Icon(Icons.search, color: Colors.white70),//图标
                                border: InputBorder.none,//去掉下划线
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(

                          child:buildGrid()
                      ),

                    ],
                  ),
                )
            )
        )
    );
  }

}
