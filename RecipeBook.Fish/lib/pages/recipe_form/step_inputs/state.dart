import 'package:fish_redux/fish_redux.dart';

class StepInputsState implements Cloneable<StepInputsState> {

  @override
  StepInputsState clone() {
    return StepInputsState();
  }
}

StepInputsState initState(Map<String, dynamic> args) {
  return StepInputsState();
}
