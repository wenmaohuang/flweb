import 'package:fluro/fluro.dart';
import 'package:flweb/routes/router_init.dart';
//
// import 'login_page.dart';
// import 'register_page.dart';
import 'package:flweb/page/ManagePage/SideBar_Edit/SideBar_Edit.dart';


class ManageEditRouter implements IRouterProvider{

  static String blogPage = "manage/edit";
  // static String registerPage = "/login/register";

  @override
  void initRouter(Router router) {
    router.define(blogPage, handler: Handler(handlerFunc: (_, params) => SideBar_Edit()));
    // router.define(registerPage, handler: Handler(handlerFunc: (_, params) => Register()));
  }

}