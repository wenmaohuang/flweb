import 'package:flutter/material.dart';
import 'package:flweb/costom/ColorsUtil.dart';



class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
        // height: 700,
        color: ColorsUtil.hexColor(0x3caafa, alpha: 0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [Text('发表文章'
,
        ),
          RaisedButton(
              highlightColor: Colors.blue,
              color: Colors.transparent,
              hoverColor: Colors.transparent,
              elevation: 0,
              child:Text('发表文章',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              onPressed: () {
                Navigator.pushNamed(context, '/manage/send');
              }),
          RaisedButton(
              highlightColor: Colors.blue,
              color: Colors.transparent,
              hoverColor: Colors.transparent,
              elevation: 0,
              child:Text('编辑文章',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              onPressed: () {
                Navigator.pushNamed(context, '/manage/edit');
              }),

          Text('编辑文章')],)
        );
  }
}
