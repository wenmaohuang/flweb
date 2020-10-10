import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Select_Menu1.dart';
import 'Select_Menu2.dart';
import 'Upload.dart';

class Rich_Text extends StatefulWidget {
  @override
  _Rich_TextState createState() => _Rich_TextState();
}

class _Rich_TextState extends State<Rich_Text> {

  TextEditingController _controller1;

 List<String> arr = ['A', 'B', 'C', 'D'];
 String selectValue = '';

  @override
  void initState() {
    super.initState();
  }

  GlobalKey anchorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size.width-450;

    print('${screenSize}yh');

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    Widget _buildArrList() {
      List<Widget> arrList = []; //先建一个数组用于存放循环生成的widget
      arr.forEach((element) {
        arrList.add(Text(element));
      });
      return Column(children: arrList);
    }




    return Container(

      // width: 500,
      //   height: 700,

        padding: new EdgeInsets.all(50),
        decoration: new BoxDecoration(
          color: Colors.blue[200],
          // borderRadius: new BorderRadius.circular(25.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,


          children: [

            Row(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,


              children: [
                Container(child: Text('*',

                    style:TextStyle(
                        color: Colors.red,
                        fontSize: 20

                    )
                ),
                  // width: 20,
                ),

                Container(
                  height: 40,
                  margin: EdgeInsets.only(left:10,bottom: 20),

                  // padding:  EdgeInsets.only(left:50,right: 100),
                  width: screenSize,
                  child: TextField(

                    obscureText: false,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 1,
                    controller: _controller1,
                    decoration: const InputDecoration(
                      hintText: '....',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      isDense: true,
                      border: const OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),




            SelectMenu1(),
            SelectMenu2(),

            Container(
              // height: 500,
              width: screenSize,
              margin: EdgeInsets.only(left:17,bottom: 10),

              // padding:  EdgeInsets.only(left:50,right: 100),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 50000,
                minLines: 10,
                decoration: const InputDecoration(
                  hintText: '输入',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  isDense: true,
                  border: const OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            ImagePickerPage(),
            RaisedButton(
                highlightColor: Colors.blue,
                // color: Colors.,
                hoverColor: Colors.transparent,
                elevation: 0,
                child:Text('提交',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onPressed: () {
                  // Navigator.pushNamed(context, '/manage/send');
                }),


          ],
        ));
  }
}
