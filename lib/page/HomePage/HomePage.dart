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
  final myController2 = TextEditingController();

  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode2 = FocusNode();

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
    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        print('得到焦点');
        print(myController2);

      } else {
        print('失去焦点');
        // var url = 'http://www.baidu.com/s?wd=${myController.text}';
        // launch(url);
        print(myController2);
      }
    });

  }

  @override
  void dispose() {
    //页面销毁时
    myController2.dispose();

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


    List<Widget> urlTitles = []; //先建一个数组用于存放循环生成的widget
    var newKeysResultState;


    Widget _buildUrlInput(){

      List<Widget> urlTitlesState = []; //先建一个数组用于存放循环生成的widget
      List<dynamic> newKeys = urlList.keys.toList();
      newKeys.sort((a, b) {
        List<int> al = a.codeUnits;
        List<int> bl = b.codeUnits;
        for (int i = 0; i < al.length; i++) {
          if (bl.length <= i) return 1;
          if (al[i] > bl[i]) {
            return 1;
          } else if (al[i] < bl[i]) return -1;
        }
        return 0;
      });

      return Column(
        children: [
          Container(
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
              onChanged: (String val) {

                newKeys.forEach((element) {
                  RegExp reg = new RegExp(r"^"+myController2.text+".+");
                  var newKeysResult = reg.stringMatch(element);
                  print('${newKeysResult}');

                  Widget urlInputState;
                  Widget urlInput;
                  setState(() {
                    newKeysResultState = newKeysResult;
                  });



                });

              },
              controller: myController2,
              focusNode: _focusNode2,

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
        ],
      );
    }

    Widget _buildUrlList() {

      // print('${urlTitles}aaa');
      //
      // urlTitles.add(Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       RaisedButton(
      //         onPressed: () {
      //           var url = urlList[newKeysResultState];
      //           launch(url);
      //         },
      //         child: Text(newKeysResultState),
      //       ),
      //       // new Text(item)
      //     ]));

      List<Widget> urlTitles = []; //先建一个数组用于存放循环生成的widget
      for (var item in array) {
        urlTitles.add(new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  // var url = 'http://www.baidu.com/s?wd=${item}';
                  var url = urlList[newKeysResultState];

                  launch(url);
                },
                // child: Text(item),
                child: Text('${newKeysResultState}'),

              ),
              // new Text(item)
            ]));
      }
      print('${urlTitles}aaa');

      // Widget newUrlTitles = Column(children: urlTitles);
      return urlTitles.length>0 ? Column(
        children: [
          Container(
            //1 注意：父容器的宽高是200 减去pading后是180
            padding: EdgeInsets.all(10),
            color: Colors.green,
            width: 200,
            height: 200,
            child: new OverflowBox(
                maxHeight: 200, //2 不能小于父容器的高度180
                child: SingleChildScrollView(
                  child: Column( children:urlTitles),
                )

            ),
          ),
        ],
      ) : Container();

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
          Column(children: [
            _buildUrlInput(),
            _buildUrlList()
          ],)

        ],
      ),
    );
  }
}
