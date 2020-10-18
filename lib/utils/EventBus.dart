import 'package:event_bus/event_bus.dart';

//Bus 初始化
EventBus eventBus = EventBus();

//广播数据
class ChildSubmit3 {
  // ProductContentEvent 此为自己定义的广播名称。
  double height;

  ChildSubmit3(double height) {
    this.height = height;
  }
}
class ChildSubmit2 {
  // ProductContentEvent 此为自己定义的广播名称。
  double height;

  ChildSubmit2(double height) {
    this.height = height;
  }
}
class ChangeInput {
  // ProductContentEvent 此为自己定义的广播名称。
  double height;

  ChangeInput(double height) {
    this.height = height;
  }
}
