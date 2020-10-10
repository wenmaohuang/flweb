import 'package:flutter/material.dart';

class ArticleMain extends StatefulWidget {
  @override
  _ArticleMainState createState() => _ArticleMainState();
}

class _ArticleMainState extends State<ArticleMain> {
  @override
  Widget build(BuildContext context) {
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
    return Container(
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
                      Text('${article['date']}'),
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
              Text('${article['surface']}'),
              Text('${article['content']}')
            ],),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
            Text('${article['tab']}'),
            Text('${article['readCount']}')

            ],),
          )
        ],
      ),
    );
  }
}
