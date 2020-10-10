import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectMenu2 extends StatefulWidget {
  @override
  _SelectMenu2State createState() => _SelectMenu2State();
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


class _SelectMenu2State extends State<SelectMenu2> {
  TextEditingController _controller3;
  FocusNode focusNode = new FocusNode();
  OverlayEntry overlayEntry;

  LayerLink layerLink = new LayerLink();
  double inputHeight;
  double inputWidth;

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
          inputHeight = offset.dy+3;
          inputWidth = offset.dx;

        });


        print('${inputHeight}ik');
        double a=3.2222;
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
        left: inputWidth,
        child: new CompositedTransformFollower(
          offset: Offset(0.0, 50),
          link: layerLink,
          child: new Material(
            child: new Container(
                // color: Colors.lightBlueAccent,
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text("选项3"),
                      onTap: () {
                        // Toast.show(context: context, message: "选择了选项3");
                        setState(() {
                          _controller3 = new TextEditingController(text: '选项3');
                        });
                        focusNode.unfocus();
                      },
                    ),
                    new ListTile(
                        title: new Text("选项4"),
                        onTap: () {
                          // Toast.show(context: context, message: "选择了选项4");
                          setState(() {
                            _controller3 = new TextEditingController(text: '选项4');
                          });
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
    var screenSize = MediaQuery.of(context).size.width - 450;

    return Row(
      children: [
        Text('*',

            style:TextStyle(
                color: Colors.red,
                fontSize: 20

            )
        ),


        Container(
          height: 40,
          width: screenSize,
          margin: EdgeInsets.only(left:10,bottom: 20),

          // padding:  EdgeInsets.only(left:50,right: 100),
          child: TextField(
            obscureText: false,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            focusNode: focusNode,
            key: anchorKey,
            controller: _controller3,
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
    );
  }
}
