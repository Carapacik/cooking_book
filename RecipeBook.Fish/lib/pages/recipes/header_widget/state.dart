import 'package:fish_redux/fish_redux.dart';

class HeaderWidgetState implements Cloneable<HeaderWidgetState> {

  @override
  HeaderWidgetState clone() {
    return HeaderWidgetState();
  }
}

HeaderWidgetState initState(Map<String, dynamic> args) {
  return HeaderWidgetState();
}
