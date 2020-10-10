import 'package:flutter/material.dart';

class ArticleSelect extends StatefulWidget {
  @override
  _ArticleSelectState createState() => _ArticleSelectState();
}

class _ArticleSelectState extends State<ArticleSelect> {
  FocusNode focusNode = FocusNode();
  var hoverColor1 = Colors.transparent;
  var hoverColor2 = Colors.transparent;
  var hoverColor3 = Colors.transparent;

  @override
  void initState() {
    super.initState();
    setState(() {
      hoverColor1 = Colors.deepPurpleAccent;
    });

    //添加listener监听
    //对应的TextField失去或者获取焦点都会回调此监听
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            // color: Colors.yellow,
            // padding: EdgeInsets.only(right: 10),

            decoration: BoxDecoration(
                // color: Colors.white,
                border: Border(
                    right: BorderSide(
              color: hoverColor1,
              width: 4.0,
            ))),

            child: InkWell(
              onHover: (isHovering) {
                if (isHovering) {
                  print('${isHovering}.;');
                  setState(() {
                    hoverColor1 = Colors.deepPurpleAccent;
                  });
                } else {
                  setState(() {
                    hoverColor1 = Colors.transparent;
                  });
                }
              },
              onTap: () {
                print('----');
              },
              child: ListTile(
                focusNode: focusNode,
// contentPadding: EdgeInsets.only(right: 10),
                title: new Text(
                  "选项1",
                  textAlign: TextAlign.center,
                ),

                // tileColor: Colors.blueGrey,
                onTap: () {},

                // hoverColor: Colors.white,
              ),
            ),
          ),
          Container(
            // color: Colors.yellow,
            // padding: EdgeInsets.only(right: 10),

            decoration: BoxDecoration(
                // color: Colors.white,
                border: Border(
                    right: BorderSide(
              color: hoverColor2,
              width: 4.0,
            ))),

            child: InkWell(
              onHover: (isHovering) {
                if (isHovering) {
                  print('${isHovering}.;');
                  setState(() {
                    hoverColor2 = Colors.deepPurpleAccent;
                    hoverColor1 = Colors.transparent;

                  });
                } else {
                  setState(() {
                    hoverColor2 = Colors.transparent;
                  });
                }
              },
              onTap: () {
                print('----');
              },
              child: ListTile(
                focusNode: focusNode,
// contentPadding: EdgeInsets.only(right: 10),
                title: new Text(
                  "选项1",
                  textAlign: TextAlign.center,
                ),

                // tileColor: Colors.blueGrey,
                onTap: () {},

                // hoverColor: Colors.white,
              ),
            ),
          ),
          Container(
            // color: Colors.yellow,
            // padding: EdgeInsets.only(right: 10),

            decoration: BoxDecoration(
                // color: Colors.white,
                border: Border(
                    right: BorderSide(
              color: hoverColor3,
              width: 4.0,
            ))),

            child: InkWell(
              onHover: (isHovering) {
                if (isHovering) {
                  print('${isHovering}.;');
                  setState(() {
                    hoverColor3 = Colors.deepPurpleAccent;
                    hoverColor1 = Colors.transparent;
                  });
                } else {
                  setState(() {
                    hoverColor3 = Colors.transparent;
                  });
                }
              },
              onTap: () {
                print('----');
              },
              child: ListTile(
                focusNode: focusNode,
// contentPadding: EdgeInsets.only(right: 10),
                title: new Text(
                  "选项1",
                  textAlign: TextAlign.center,
                ),

                // tileColor: Colors.blueGrey,
                onTap: () {},

                // hoverColor: Colors.white,
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      // color: Colors.green,
      height: 180,
      width: 350,
    );
  }
}
