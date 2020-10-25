import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



class ArticleMain extends StatefulWidget {
  @override
  _ArticleMainState createState() => _ArticleMainState();
}

class _ArticleMainState extends State<ArticleMain> {
  Map article = {
    'type': '转载',
    'title': '队列',
    'date': 2,
    'month': '5',
    'year': '2020',
    'surface':'surface',
    'content': '..........................',
    'tab': 'javaScript',
    'readCount': 0
  };
  List articleList = [];
  void initState(){
    super.initState();
    fetchPost();
  }

  Future fetchPost() async {
    try {
      final response = await Dio().post('http://localhost:3004/flweb/article/getShow', );
      // print(1);

      var responseData = response.data;
      var data = responseData['data'];
      // print('${data}io');
      setState(() {
        articleList = data;
      });
      // print(2);
      // print('${article}ui');
    } catch (e) {
      print(e);
    }
  }





  @override
  Widget build(BuildContext context) {

    Widget commentList(context,article){
      return Container(
        padding: EdgeInsets.all(20),
        width: 700,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          '【${article['type']}】',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Text('${article['title']}'),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('${article['day']}'),
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('${article['month']}月'),
                              Text('${article['year']}'),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Container(
                    width:350,
                    child: Image.network('${article['surface']}'),),
                  // Text('${article['surface']}'),
                  Text('${article['content']}')
                ],),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('${article['tag']}'),
                  Text('${article['readcount']}')

                ],),
            )
          ],
        ),
      );
    }


    return Container(
      width: 700,
      height: 1000,
      child: ListView(
        children: articleList.map((item){
          return commentList(context,item);//这是一个Widget组件
        }).toList(),
      ),
    );

  }
}
