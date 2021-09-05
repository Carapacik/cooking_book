import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainInputsAction { action }

class MainInputsActionCreator {
  static Action onAction() {
    return const Action(MainInputsAction.action);
  }
}
