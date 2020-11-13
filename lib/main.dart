import 'package:flutter/material.dart' hide Router;

import 'package:flweb/page/BlogPage/BlogPage.dart';
import 'package:flweb/page/HomePage/HomePage.dart';
import 'package:flweb/routes/routes.dart';
import 'package:flweb/routes/application.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:flweb/utils/CounterModel.dart';



// void main() {
//   final counter = CounterModel();
//   final textSize = 48;
//
//   runApp(
//     Provider<int>.value(
//       value: textSize,
//       child: ChangeNotifierProvider.value(
//         value: counter,
//         child: MyApp(),
//       ),
//     ),
//   );
// }


void main() {
  final counter = CounterModel(1);
  final input3 = InputModel3('');
  final input2 = InputModel2('');

  final height1 = InputHeight1(40);
  final height2 = InputHeight2(40);
  final height3 = InputHeight3(40);

  final textSize = 48;
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: textSize),
        ChangeNotifierProvider.value(value: counter),
        ChangeNotifierProvider.value(value: input3),
        ChangeNotifierProvider.value(value: input2),

        ChangeNotifierProvider.value(value: height1),
        ChangeNotifierProvider.value(value: height2),
        ChangeNotifierProvider.value(value: height3),

      ],
      child: MyApp(),
    ),
  );
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
  @override
  void initState() {
    super.initState();
    currentPage=tabBodies[currentIndex];
  }
  final List<BottomNavigationBarItem> bottomTabs=[
    BottomNavigationBarItem(
  icon: Icon(Icons.home), title: Text('home')
    ),
    BottomNavigationBarItem(
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
      print('手机布局!!!!!!!!!');
    }
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return MaterialApp(
// onGenerateRoute: onGenerateRoute
      onGenerateRoute: Application.router.generator,
      initialRoute: '/manage',
      home:Scaffold(
        body:IndexedStack(
          index: currentIndex,//当前页面序号
          children: tabBodies,//必须返回的是组件
        ),
      ),
    );
  }
}







