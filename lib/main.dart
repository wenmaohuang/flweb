import 'package:flutter/material.dart' hide Router;

import 'package:flweb/page/BlogPage/BlogPage.dart';
import 'package:flweb/page/HomePage/HomePage.dart';
import 'package:flweb/routes/routes.dart';
import 'package:flweb/routes/application.dart';
import 'package:fluro/fluro.dart';



void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  var currentPage;
  final List<Widget> tabBodies=[
    HomePage(),
    BlogPage()
  ];


  // List _PageList = [
  //   HomePage(),
  //   BlogPage()
  // ];
  @override
  void initState() {

    super.initState();
    currentPage=tabBodies[currentIndex];
  }

  final List<BottomNavigationBarItem> bottomTabs=[
    BottomNavigationBarItem(
      // icon:Icon(CupertinoIcons.home),
      //
      // title:Text('首页'),
  icon: Icon(Icons.home), title: Text('home')

    ),
    BottomNavigationBarItem(
      // icon:Icon(CupertinoIcons.search),
      // title:Text('分类'),

  icon: Icon(Icons.home), title: Text('home')
    ),

  ];



  @override
  Widget build(BuildContext context) {



    var screenSize = MediaQuery.of(context).size;
    bool _largeScreen;
    Widget _bottomBar;
    if (screenSize.width > 600) {
      //平板布局
      _largeScreen = true;
      _bottomBar = null;

      print('平板布局');
    } else {
      //手机布局
      _largeScreen = true;
      _bottomBar = null;

      // _bottomBar = BottomNavigationBar(
      //     currentIndex: this._currentIndex,
      //     onTap: (int index) {
      //       print(index);
      //       setState(() {
      //         this._currentIndex = index;
      //       });
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home), title: Text('home')),
      //       BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('blog'))
      //     ]);
      print('手机布局');
    }

    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;



    return MaterialApp(


// onGenerateRoute: onGenerateRoute
      onGenerateRoute: Application.router.generator,
      initialRoute: '/',

      // routes: {
      //   '/': (context)=>HomePage(),
      //   '/blog': (context)=>BlogPage(),
      //
      // },




      home:Scaffold(
        // body: this._PageList[this._currentIndex],
        // bottomNavigationBar: _bottomBar,

        body:IndexedStack(
          index: currentIndex,//当前页面序号
          children: tabBodies,//必须返回的是组件
        ),

        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: currentIndex,
        //   items: bottomTabs,
        //   onTap: (index){
        //     setState(() {
        //       currentIndex=index;
        //       currentPage=tabBodies[currentIndex];
        //     });
        //   },
        // ),


      ),
    );
  }
}







