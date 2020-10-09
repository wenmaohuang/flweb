import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectMenu1 extends StatefulWidget {
  @override
  _SelectMenu1State createState() => _SelectMenu1State();
}

class Toast {
  static void show({@required BuildContext context, @required String message}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          child: new Material(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: new Center(
                child: new Card(
                  child: new Padding(
                    padding: EdgeInsets.all(8),
                    child: new Text(message),
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    //两秒后，移除Toast
    new Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}

class _SelectMenu1State extends State<SelectMenu1> {
  TextEditingController _controller2;

  FocusNode focusNode = new FocusNode();
  OverlayEntry overlayEntry;

  LayerLink layerLink = new LayerLink();
  double inputHeight;
  GlobalKey anchorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        RenderBox renderBox = anchorKey.currentContext.findRenderObject();
        var offset =
            renderBox.localToGlobal(Offset(0.0, renderBox.size.height));
        setState(() {
          inputHeight = offset.dy;
        });

        print('${inputHeight}ik');
        double a = 3.2222;
        print('${a}ol');

        overlayEntry = createSelectPopupWindow();
        Overlay.of(context).insert(overlayEntry);
      } else {
        overlayEntry.remove();
      }
    });
  }

  OverlayEntry createSelectPopupWindow() {
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      var screenSize = MediaQuery.of(context).size.width - 450;

      return new Positioned(
        width: screenSize,
        top: inputHeight,
        left: 360,
        child: new CompositedTransformFollower(
          offset: Offset(0.0, 50),
          link: layerLink,
          child: new Material(
            child: new Container(
                color: Colors.grey,
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text("选项1"),
                      onTap: () {
                        setState(() {
                          _controller2 = new TextEditingController(text: '选项1');
                        });
                        // _controller2.value = "选项1";
                        // Toast.show(context: context, message: "选择了选项1");
                        focusNode.unfocus();
                      },
                    ),
                    new ListTile(
                        title: new Text("选项2"),
                        onTap: () {
                          // _controller2.text = "选项2";
                          setState(() {
                            _controller2 =
                                new TextEditingController(text: '选项2');
                          });

                          // Toast.show(context: context, message: "选择了选项1");
                          focusNode.unfocus();
                        }),
                  ],
                )),
          ),
        ),
      );
    });
    return overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    List<String> arr = ['A', 'B', 'C', 'D'];
    var screenSize = MediaQuery.of(context).size.width - 450;
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    Widget _buildArrList() {
      List<Widget> arrList = []; //先建一个数组用于存放循环生成的widget
      arr.forEach((element) {
        arrList.add(Text(element));
      });
      return Column(children: arrList);
    }

    // RenderBox renderBox = anchorKey.currentContext.findRenderObject();

    // RenderBox renderBox = anchorKey.currentContext.findRenderObject();
    // var offset =  renderBox.localToGlobal(Offset(0.0, renderBox.size.height));

    // print('${offset}k,');

    return Row(
      children: [
        Text('*', style: TextStyle(color: Colors.red, fontSize: 20)),
        Container(
          height: 40,
          width: screenSize,
          // padding:  EdgeInsets.only(left:50,right: 100),
          child: TextField(
            obscureText: false,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            key: anchorKey,
            controller: _controller2,
            onTap: () {
              var inputHeight = MediaQuery.of(context).size.height;
            },
            focusNode: focusNode,
            decoration: const InputDecoration(
              hintText: '....',
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              isDense: true,
              border: const OutlineInputBorder(
                gapPadding: 0,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
