import 'package:flutter/material.dart';
import 'package:flweb/costom/ColorsUtil.dart';
class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(20),
      // color: Color(0xFF3CAAFA),
      // color: ColorsUtil.hexColor(0x3caafa,alpha: 0.5),//透明度为0.5,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('FYYD',
                  style: TextStyle(
                    fontSize: 18,
                  ))],
            ),
          ),
          Container(
              width: 700,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                      highlightColor: Colors.blue,
                      color: Colors.transparent,
                      hoverColor: Colors.transparent,
                      elevation: 0,
                      child: Text('首页',
                          style: TextStyle(
                            fontSize: 18,
                              )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      }),
                  RaisedButton(
                      highlightColor: Colors.blue,
                      color: Colors.transparent,
                      hoverColor: Colors.transparent,
                      elevation: 0,
                     child:Text('博客',
                         style: TextStyle(
                           fontSize: 18,
                         )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/blog');
                      }),
                  RaisedButton(
                      highlightColor: Colors.blue,
                      color: Colors.transparent,
                      hoverColor: Colors.transparent,
                      elevation: 0,
                      child: Text('管理',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/manage');
                      }),
                  RaisedButton(
                      highlightColor: Colors.blue,
                      color: Colors.transparent,
                      hoverColor: Colors.transparent,
                      elevation: 0,
                      child: Text('留言',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      }),
                  RaisedButton(
                      highlightColor: Colors.blue,
                      color: Colors.transparent,
                      hoverColor: Colors.transparent,
                      elevation: 0,
                      child: Text('日记',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      }),
                  RaisedButton(
                      highlightColor: Colors.blue,
                      color: Colors.transparent,
                      hoverColor: Colors.transparent,
                      elevation: 0,
                    child:  Text('友链',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      }),
                  RaisedButton(
                      highlightColor: Colors.blue,
                      color: Colors.transparent,
                      hoverColor: Colors.transparent,
                      elevation: 0,
                     child: Text('关于',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      }),






                ],
              )),
          Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('注册',
                  style: TextStyle(
                    fontSize: 18,
                  )), Text('登陆',
                  style: TextStyle(
                    fontSize: 18,
                  ))],
            ),
          )
        ],
      ),
    );
  }
}
