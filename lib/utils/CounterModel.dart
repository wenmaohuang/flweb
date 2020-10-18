import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class CounterModel with ChangeNotifier {
  int _count = 0;
  CounterModel(this._count);
  int get count => _count;

  void increment(args) {
    // _count++;
    _count = _count + args;
    notifyListeners();
  }
}
class InputModel2 with ChangeNotifier {
  String _input2 = '';
  InputModel2(this._input2);
  String get input2 => _input2;

  void getInput(args) {
    _input2 = args;
    notifyListeners();
  }
}
class InputModel3 with ChangeNotifier {
  String _input3 = '';
  InputModel3(this._input3);
  String get input3 => _input3;

  void getInput(args) {
    _input3 = args;
    notifyListeners();
  }
}

class InputHeight1 with ChangeNotifier {
  double _height1 = 40;
  InputHeight1(this._height1);
  double get height1 => _height1;


  void getHeight1(args) {
    _height1 = args;
    notifyListeners();

  }
}

class InputHeight2 with ChangeNotifier {
  double _height2 = 40;
  InputHeight2(this._height2);
  double get height2 => _height2;


  void getHeight2(args) {
    _height2 = args;
    notifyListeners();

  }
}

class InputHeight3 with ChangeNotifier {
  double _height3 = 40;
  InputHeight3(this._height3);
  double get height3 => _height3;


  void getHeight3(args) {
    _height3 = args;
    notifyListeners();

  }
}


class OnSubmit with ChangeNotifier {
  double _height = 40;
  OnSubmit(this._height);
  double get height => _height;


  // void getHeight(args) {
  //   _height = args;
  //   notifyListeners();
  //
  // }
  GlobalKey anchorKey = GlobalKey();


  // void onChildSubmit() {
  //   final form = anchorKey.currentState;
  //   if(form.validate()) {
  //     form.save();
  //   }
  // }

}