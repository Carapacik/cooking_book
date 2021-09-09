import 'package:fish_redux/fish_redux.dart';

class MainInputsState implements Cloneable<MainInputsState> {
  @override
  MainInputsState clone() {
    return MainInputsState();
  }
}

MainInputsState initState(Map<String, dynamic> args) {
  return MainInputsState();
}
