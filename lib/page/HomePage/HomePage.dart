import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flweb/page/HomePage/Footer.dart';
import 'package:flweb/page/HomePage/urlList.dart';

// import 'package:flutter/S';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flweb/utils/storage_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List array = [];

  var obj = {};
  final myController = TextEditingController();

  // 获取  需要在async方法中获取
  // getToken(data) async {
  //   // String input = myController.text;
  //   List<String> arr = await StorageUtil.getStringListItem('inputList');
  //
  //   arr.add(data);
  //
  //
  //   if (arr.length > 8) {
  //     arr.removeLast();
  //   }
  //   StorageUtil.setStringListItem('inputList', arr);
  //
  //
  //   List inputList =
  //   await StorageUtil.getStringListItem('inputList');
  //   // if (inputList != null) {
  //   //   // 跳转到首页
  //   //   Navigator.pushReplacementNamed(context, "bottom_nav_bar");
  //   // } else {
  //   //   // 跳转到登陆页面
  //   //   Navigator.pushReplacementNamed(context, "login");
  //   // }
  //   print('${inputList}za');
  //   return inputList;
  //
  //
  // }

  @override
  bool get wantKeepAlive => true; //必须重写

  FocusNode _focusNode = FocusNode();

  // int currentIndex=0;
  // var currentPage;

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

  String myInputHistory = 'inputHistory';
  String myInputHistoryList = 'inputHistoryList';

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(myInputHistory, myController.text);
  }

  Future<String> get() async {
    String inputHistory;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    inputHistory = prefs.getString(myInputHistory);
    return inputHistory;
  }
  List<String> myInputList =[];


  saveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String myInput = myController.text;

    if(myInput != null){
      myInputList.add(myInput);
      print('${myInputList}23');

      prefs.setStringList(myInputHistoryList,myInputList);
    }



  }

  Future<List> getList() async {
    List inputHistoryList;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    inputHistoryList = prefs.getStringList(myInputHistoryList);
    return inputHistoryList;
  }


  @override
  void initState() {
    //页面初始化
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print('得到焦点');
        // Future<String> inputHistory = get();
        // inputHistory.then((String inputHistory) {
        //   print('${inputHistory}zaq');
        //   List<String> arr = [];
        //   if (inputHistory != null) {
        //     arr.add(inputHistory);
        //
        //   }
        //
        //   setState(() {
        //     array = arr;
        //   });
        //
        //   print('${array}12');
        // });

        Future<List> inputHistoryList = getList();
        inputHistoryList.then((List inputHistoryList) {
          print('${inputHistoryList}zaq');
          // List<String> arr = [];
          if (inputHistoryList != null) {

            setState(() {
              array = inputHistoryList;
            });

          }



          print('${array}12');
        });

      } else {
        print('失去焦点');
        var url = 'http://www.baidu.com/s?wd=${myController.text}';
        launch(url);

        saveList();
      }
    });
  }

  final List<Widget> tabBodies = [
    HomePage(),
  ];

  @override
  void dispose() {
    //页面销毁时

    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _InfoInput;
    var screenSize = MediaQuery.of(context).size;
    var deviceHeight = screenSize.height;
    print('${deviceHeight}wc');

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
            autofocus: true,
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

      _InfoInput = Container(
        padding: new EdgeInsets.only(top: 200, left: 40, right: 40, bottom: 19),
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
    }

    Widget _buildInfoList() {
      List<Widget> titles = []; //先建一个数组用于存放循环生成的widget
      for (var item in array) {
        titles.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  print('${item}sw');

                  var url = 'http://www.baidu.com/s?wd=${item}';
                  launch(url);
                },
                child: Text(item),
              ),
              // new Text(item)
            ]));
      }
      print('${titles}bbb');
      return titles.length > 0
          ? Container(
              height: deviceHeight - 200,
              child: SingleChildScrollView(
                child: Column(
                  children: titles,
                ),
              ))
          : Container(
              height: deviceHeight - 380,
            );
    }

    return Scaffold(
        body: IndexedStack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                // height:400,
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
        )
      ],
    ));
  }
}
