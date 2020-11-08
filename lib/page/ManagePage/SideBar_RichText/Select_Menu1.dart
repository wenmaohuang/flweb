import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:flweb/utils/CounterModel.dart';
import 'package:flweb/utils/EventBus.dart';

// GlobalKey<_SelectMenu1State> globalKey = GlobalKey();
GlobalKey<_SelectMenu1State> childKey = GlobalKey();

class SelectMenu1 extends StatefulWidget with ChangeNotifier {
  SelectMenu1({
    Key key,
  }) : super(key: key);

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

  String _name;

  // final _formKey = new GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  FocusNode focusNode = new FocusNode();
  OverlayEntry overlayEntry;

  LayerLink layerLink = new LayerLink();
  double inputHeight;
  double inputHeight2;
  double inputWidth;

  GlobalKey anchorKey = GlobalKey();

  void _onChildSubmit2() {
    final form = _formKey.currentState;
    print('${form.validate()}99');
    if (form.validate()) {
      form.save();

    }
  }

  @override
  void initState() {
    super.initState();
    eventBus.on<ChildSubmit2>().listen((event) {
      // print(event.height);
      _onChildSubmit2();
      // print('${event.height}qw');
    });

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        RenderBox renderBox = anchorKey.currentContext.findRenderObject();
        var offset =
            renderBox.localToGlobal(Offset(0.0, renderBox.size.height));
        setState(() {
          inputHeight = offset.dy + 3;
          inputWidth = offset.dx;
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


  void checkInputHeight2(){

    if(_controller2.text == ''){
      Provider.of<InputHeight2>(context,listen: false).getHeight2(65);

    }else{
      Provider.of<InputHeight2>(context,listen: false).getHeight2(40);

    }

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
                  title: new Text("选项1"),
                  onTap: () {
                    focusNode.unfocus();

                    setState(() {
                      _controller2 = new TextEditingController(text: '选项1');
                    });
                    Future(() => throw 'we have a problem')
                        .catchError((error) => print('$error'))
                        .whenComplete(() => _onChildSubmit2())
                    .whenComplete(() => checkInputHeight2())
                    ;
                    Provider.of<InputModel2>(context, listen: false)
                        .getInput(_controller2.text);

                  },
                ),
                new ListTile(
                    title: new Text("选项2"),
                    onTap: () {

                      focusNode.unfocus();

                      setState(() {
                        _controller2 = new TextEditingController(text: '选项2');
                      });

                      Future(() => throw 'we have a problem')

                          .catchError((error) => print('$error'))
                          .whenComplete(() => _onChildSubmit2())
                      .whenComplete(() =>checkInputHeight2() )
                      ;

                      Provider.of<InputModel2>(context, listen: false)
                          .getInput(_controller2.text);

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
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();
    inputHeight2 = Provider.of<InputHeight2>(context).height2;

    List<String> arr = ['A', 'B', 'C', 'D'];
    var screenSize = MediaQuery.of(context).size.width - 450;
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Stack(
      children: [
        Positioned(
            top: 10,
            child:
                Text('*', style: TextStyle(color: Colors.red, fontSize: 20))),

        Container(
//          height: inputHeight2,
          width: screenSize,
          margin: EdgeInsets.only(left: 15, bottom: 20),
          // padding:  EdgeInsets.only(left:50,right: 100),
          child: Form(
            key: _formKey,
            child: TextFormField(
              onFieldSubmitted: (v) => print("submit"),
              onSaved: (val) => this._name = val,
              validator: (val) =>
                  (val == null || val.isEmpty) ? "请输入商品名称" : null,
              obscureText: false,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              key: anchorKey,
              controller: _controller2,
              onTap: () {
                var inputHeight = MediaQuery.of(context).size.height;
              },
              onChanged: (String val) {
                print('${val}78');
                _onChildSubmit2();

                checkInputHeight2();


                print('${Provider.of<InputHeight2>(context).height2}-=');

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
          ),
        )
      ],
    );
  }
}
