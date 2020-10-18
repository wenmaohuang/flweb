import 'package:flutter/material.dart';
import 'package:flweb/page/ManagePage/SideBar_RichText/Rich_Text.dart';

// import 'package:flweb/lib/page/BlogPage/Nav.dart';
import 'package:flweb/page/Nav.dart';
import 'package:flweb/page/BlogPage/ArticleMain.dart';
import 'package:flweb/page/BlogPage/ArticleSearch.dart';
import 'package:flweb/page/ManagePage/SideBar.dart';
import 'package:flweb/costom/ColorsUtil.dart';
import 'package:flweb/page/ManagePage/SideBar_RichText/Rich_Text.dart';

class SideBar_RichText extends StatefulWidget {
  @override
  _SideBar_RichTextState createState() => _SideBar_RichTextState();
}

class _SideBar_RichTextState extends State<SideBar_RichText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Nav(),
          backgroundColor: ColorsUtil.hexColor(0x3caafa, alpha: 0.5), //透明度为0.5,
          toolbarHeight: 100,
        ),
        body: IndexedStack(
          // index: childIndex,
          children: [
            Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [SideBar(),Rich_Text()],
    ),
          ],
        ));
  }
}
