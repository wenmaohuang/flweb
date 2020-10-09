// import 'package:flweb/page/BlogPage/BlogPage.dart';
// import 'package:flweb/page/HomePage/HomePage.dart';
// import 'package:flutter/material.dart';
//
// final routes = {
//   '/': (context) => HomePage(),
//   '/blog': (context) => BlogPage(),
// };
// final onGenerateRoute = (RouteSettings settings) {
//   final String name = settings.name;
//   final Function pageContentBuilder = routes[name];
//   if (pageContentBuilder != null) {
//     if (settings.arguments != null) {
//       final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
//       return route;
//     } else {
//       final Route route =
//           MaterialPageRoute(builder: (context) => pageContentBuilder(context));
//       return route;
//     }
//   }
// };



import 'package:flutter/material.dart' hide Router;
//引入路由插件fluro 需要在yml文件中配置插件并下载才能引入
import 'package:fluro/fluro.dart';
//引入决定路由跳转去到而的部件router_handler
// import 'package:flweb/routes/router_handler';
//没有对应匹配路由时去的部件
// import './page_404.dart';
import 'package:flweb/page/HomePage/HomePage.dart';
import 'package:flweb/routes/router_handler';
import 'package:flweb/routes/router_init.dart';
import 'package:flweb/page/HomePage/HomePage.dart';
import 'package:flweb/routes/blog/blog.dart';
import 'package:flweb/page/BlogPage/BlogPage.dart';
import 'package:flweb/routes/manage/manage.dart';
// import 'package:flweb/page/manage/SideBar_Edit.dart';
import 'package:flweb/routes/manage/send/send.dart';
import 'package:flweb/routes/manage/edit/edit.dart';


class Routes {
  // static String root = '/';
  static String home = '/';
  static String blog = '/blog';
  // static String blog = '/blog';
  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    //notFoundHandler是匹配不到路由时执行出发的
    // router.notFoundHandler = new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params)) {
    //   //这是可以定义一个404页面部件
    //   return HomePage();
    // };
    //根路由时去homeHandler部件 当然router_handler.dart里我没定义homeHandler，可自行配置
    // router.define(root, handler: homeHandler);
    //user路由时去userHandler部件
    // router.define(user, handler: userHandler);
    //也可以直接写路由路径
    // router.define('home', handler: homeHandler);
    // router.define('/blog', handler: blogHandler);

    router.define(home, handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) => HomePage()));
    // router.define(blog,handler:Handler(handlerFunc: (BuildContext context,Map<String,List<String>> params)=>BlogPage()));

    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(BlogRouter());
    _listRouter.add(ManageRouter());
    _listRouter.add(ManageSendRouter());
    _listRouter.add(ManageEditRouter());


    /// 初始化路由 循环遍历取出每个子router进行初始化操作
    _listRouter.forEach((routerProvider){
      routerProvider.initRouter(router);
    });


    print('${_listRouter}vf');
  }
}
