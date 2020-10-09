import 'package:flutter/material.dart';
import 'package:flweb/page/Nav.dart';
import 'package:flweb/main.dart';
import 'package:flweb/page/BlogPage/ArticleMain.dart';
import 'package:flweb/page/BlogPage/ArticleSearch.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true; //必须重写
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(title: Nav(),),
          drawer: Drawer(child: Text('drawer'),),

          body: IndexedStack(
          // index: childIndex,
          children: [Column(
            children: [
              // Nav(),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,

                children: [ArticleMain(),ArticleSearch()],
              ),
              // Text('blog')
            ],
          ),],
        )



      );
  }
}
