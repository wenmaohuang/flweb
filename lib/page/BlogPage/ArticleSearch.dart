import 'package:flutter/material.dart';

class ArticleSearch extends StatelessWidget {



  FocusNode focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 80.0,
      // color: Colors.black,

      margin: EdgeInsets.only(top:30),
      padding: new EdgeInsets.only(left: 10),
      decoration: new BoxDecoration(
        color: Colors.blue[200],

        // borderRadius: new BorderRadius.circular(25.0),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 40, maxWidth: 300),
            child: new TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                hintText: '请输入搜索内容',
                prefixIcon: Icon(Icons.search),
                // contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
