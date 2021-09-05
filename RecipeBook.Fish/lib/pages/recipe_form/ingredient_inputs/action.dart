import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum IngredientInputsAction { action }

class IngredientInputsActionCreator {
  static Action onAction() {
    return const Action(IngredientInputsAction.action);
  }
}
