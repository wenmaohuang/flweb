import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flweb/page/HomePage/Footer.dart';
import 'package:flweb/page/HomePage/urlList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var array = [];
  var obj = {};
  final myController = TextEditingController();

  FocusNode _focusNode = FocusNode();

  Future fetchPost() async {
    try {
      final response = await Dio().post('http://www.fyyd.vip:3004/search',
          data: {'word': myController.text});
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



  @override
  void initState() {
    //页面初始化
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print('得到焦点');
      } else {
        print('失去焦点');
        var url = 'http://www.baidu.com/s?wd=${myController.text}';
        launch(url);
      }
    });


  }

  @override
  void dispose() {
    //页面销毁时

    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _InfoInput;

    var screenSize = MediaQuery
        .of(context)
        .size;
    if (screenSize.width > 600) {
      //平板布局
      print('平板布局');
      _InfoInput = Container(
        padding: new EdgeInsets.only(top: 250, left: 40, right: 40, bottom: 19),
        child: Container(
          width: 350,
          height: 40.0,
          padding: new EdgeInsets.only(left: 10),
          decoration: new BoxDecoration(
            color: Colors.blue[200],
            borderRadius: new BorderRadius.circular(25.0),
          ),
          child: TextFormField(
            style: new TextStyle(color: Colors.white70, fontSize: 14),
            //输入文字颜色和大小
            controller: myController,
            onChanged: (String val) {
              fetchPost();
            },
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: '请输入关键字搜索',
              //文字提示
              hintStyle: new TextStyle(color: Colors.white70),
              //提示文字颜色
              icon: Icon(Icons.search, color: Colors.white70),
              //图标
              border: InputBorder.none, //去掉下划线
            ),
          ),
        ),
      );
    } else {
      //手机布局
      print('手机布局');
      _InfoInput = PhysicalModel(
        color: Colors.blue,
        elevation: 6,
        child: Container(
          padding:
          new EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 19),
          child: Container(
            width: 350,
            height: 40.0,
            padding: new EdgeInsets.only(left: 10),
            decoration: new BoxDecoration(
              color: Colors.blue[200],
              borderRadius: new BorderRadius.circular(25.0),
            ),
            child: TextFormField(
              style: new TextStyle(color: Colors.white70, fontSize: 14),
              //输入文字颜色和大小
              controller: myController,
              onChanged: (String val) {
                fetchPost();
              },
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: '请输入关键字搜索',
                //文字提示
                hintStyle: new TextStyle(color: Colors.white70),
                //提示文字颜色
                icon: Icon(Icons.search, color: Colors.white70),
                //图标
                border: InputBorder.none, //去掉下划线
              ),
            ),
          ),
        ),
      );
    }


    Widget _buildInfoList() {
      List<Widget> titles = []; //先建一个数组用于存放循环生成的widget
      for (var item in array) {
        titles.add(
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () {
                      var url = 'http://www.baidu.com/s?wd=${item}';
                      launch(url);
                    },
                    child: Text(item),
                  ),
                  // new Text(item)
                ])
        );
      }
      print('${titles}bbb');
      return titles.length > 0
          ?  Container(
        height: 200,
        child: OverflowBox(
            maxHeight: 300, //2 不能小于父容器的高度180

            child:SingleChildScrollView(
              child: Column(
                children: titles,
              ),
            )
        ),
      )
          : Container();
    }


    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/4.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: <Widget>[
          Container(
            height:400,
              child: Column(
                children: [
                  _InfoInput,
                  _buildInfoList(),
                  Footer(),
                ],
              ),
          ),
          UrlList()

        ],
      ),
    );
  }
}
