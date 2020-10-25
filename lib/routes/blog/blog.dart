import 'package:fluro/fluro.dart';
import 'package:flweb/routes/router_init.dart';
//
// import 'login_page.dart';
// import 'register_page.dart';
import 'package:flweb/page/BlogPage/BlogPage.dart';


class BlogRouter implements IRouterProvider{

  static String blogPage = "/flweb/blog";
  // static String registerPage = "/login/register";

  @override
  void initRouter(Router router) {
    router.define(blogPage, handler: Handler(handlerFunc: (_, params) => BlogPage()));
    // router.define(registerPage, handler: Handler(handlerFunc: (_, params) => Register()));
  }

}