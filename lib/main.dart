import 'package:flutter/material.dart';
import 'package:flweb/page/BlogPage/BlogPage.dart';
import 'package:flweb/page/HomePage/HomePage.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home()
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }
  int _currentIndex = 0;
  List _PageList = [
    HomePage(),
    BlogPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._PageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (int index) {
            print(index);
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('home')),
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('blog'))
          ]),
    );
  }
}


