import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum StepInputsAction { action }

class StepInputsActionCreator {
  static Action onAction() {
    return const Action(StepInputsAction.action);
  }
}
