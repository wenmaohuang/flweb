import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Select_Menu1.dart';
import 'Select_Menu2.dart';
import 'Upload.dart';
import 'Upload2.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:flweb/utils/CounterModel.dart';
import 'package:flweb/utils/EventBus.dart';
// import 'dart：convert'show JSON;
import 'dart:convert';

class Rich_Text extends StatefulWidget {
  Rich_Text({
    Key key,
  }) : super(key: key);

  @override
  _Rich_TextState createState() => _Rich_TextState();
}

class _Rich_TextState extends State<Rich_Text> {
  // TextEditingController _controller1;



  // final _formKey = new GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String title;
  String _name;
  double _inputHeight1 =40;


  void _onSubmit() {
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
    }
  }
  final _controller1 = TextEditingController();
  final _controller4 = TextEditingController();
 List<String> arr = [];
 // String selectValue = '';
  @override
  void initState() {
    super.initState();
  }
  GlobalKey anchorKey = GlobalKey();
 // var selectMenu1 = new SelectMenu1();
  @override
  Widget build(BuildContext context) {
    final input3 = Provider.of<InputModel3>(context).input3;
    final input2 = Provider.of<InputModel2>(context).input2;
    print('${input2}0-');

    // print('${input1}78');
    DateTime time  = DateTime.now();
    print('${time.day}we');
    int day = time.day;
    int month = time.month;
    int year = time.year;
    print('${month},${year}er');
    // print('${time.substring(0, 2}');

    // var dt = new DateTime.now();
    // var str = jsonEncode(dt);
    // print(str);


    Future fetchPost() async {
      print('${_controller1.text}45');

      try {
        final response = await Dio().post('http://localhost:3004/article/send',
            data: {'title': _controller1.text,'type':input2,'tag':input3,'content':_controller4.text,'readcount':0,'day':day,'month':month,'year':year});
        print(1);
        // print(response.data+'er');
        print('${response}ert');
        // var data = response.data;
        // setState(() {
        //   array = data;
        // });
        print(2);
      } catch (e) {
        print(e);
      }
    }

    void checkInputHeight1(){
      if(_controller1.text == ''){
        Provider.of<InputHeight1>(context,listen: false).getHeight1(65);

      }else{
        Provider.of<InputHeight1>(context,listen: false).getHeight1(40);

      }

    }


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
        padding: new EdgeInsets.all(50),
        decoration: new BoxDecoration(
          color: Colors.blue[200],
          // borderRadius: new BorderRadius.circular(25.0),
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Positioned(
                top:10,
                  child: Text('*',
                    style:TextStyle(
                        color: Colors.red,
                        fontSize: 20
                    )
                ), // width: 20,
                ),
                Container(
                  height: Provider.of<InputHeight1>(context).height1,

                  margin: EdgeInsets.only(left:15,bottom: 20),

                  // padding:  EdgeInsets.only(left:50,right: 100),
                  width: screenSize,
                  child: Form(

                    key: _formKey,
                    child: TextFormField(

                      onFieldSubmitted:(v)=>print("submit"),
                      onSaved: (val)=> this._name = val,
                      validator: (val)=> (val == null || val.isEmpty) ? "请输入商品名称": null,
                      obscureText: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      controller: _controller1,
                      onChanged: (String val){
                        _onSubmit();
                        checkInputHeight1();
                      },
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
                controller: _controller4,
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
            // HeadImageUploadPage(),
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
                  fetchPost();
                  _onSubmit();
                  // childKey.currentState.onChildSubmit1();

                  print('${_controller1.text}');

                  if(input2 == ''){
                    eventBus.fire(new ChildSubmit2(65));
                    eventBus.fire(new ChildSubmit3(65));

                    Provider.of<InputHeight2>(context,listen: false).getHeight2(65);
                    Provider.of<InputHeight3>(context,listen: false).getHeight3(65);


                  }else{
                    eventBus.fire(new ChildSubmit2(40));
                    eventBus.fire(new ChildSubmit3(40));
                    Provider.of<InputHeight2>(context,listen: false).getHeight2(40);
                    Provider.of<InputHeight3>(context,listen: false).getHeight3(40);

                  }
                  checkInputHeight1();



                }),
          ],
        ));
  }
}
