import 'package:flutter/material.dart';
import 'package:flweb/page/ManagePage/SideBar_RichText/Rich_Text.dart';

// import 'package:flweb/lib/page/BlogPage/Nav.dart';
import 'package:flweb/page/Nav.dart';
import 'package:flweb/page/BlogPage/ArticleMain.dart';
import 'package:flweb/page/BlogPage/ArticleSearch.dart';
import 'package:flweb/page/ManagePage/SideBar.dart';
import 'package:flweb/costom/ColorsUtil.dart';
import 'package:flweb/page/ManagePage/SideBar_Edit/Edit.dart';

class SideBar_Edit extends StatefulWidget {
  @override
  _SideBar_EditState createState() => _SideBar_EditState();
}

class _SideBar_EditState extends State<SideBar_Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Nav(),
          backgroundColor: ColorsUtil.hexColor(0x3caafa, alpha: 0.5), //透明度为0.5,

          toolbarHeight: 100,
        ),
        // drawer: Drawer(
        //   child:ListView(
        //     children: [
        //       UserAccountsDrawerHeader(
        //         accountEmail: Text('wo shi Email'),
        //         accountName: Text('我是Drawer'),
        //         onDetailsPressed: () {},
        //         currentAccountPicture: CircleAvatar(
        //           // backgroundImage: AssetImage('images/ab.jpg'),
        //         ),
        //       ),
        //     ],
        //   )
        // ),

        body: IndexedStack(
          // index: childIndex,
          children: [
            Column(
              children: [
                // Nav(),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [SideBar(),Edit()],
                ),
                // Text('manage')
              ],
            ),
          ],
        ));
  }
}
