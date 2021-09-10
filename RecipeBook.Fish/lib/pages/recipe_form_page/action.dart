import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecipeFormAction { action }

class RecipeFormActionCreator {
  static Action onAction() {
    return const Action(RecipeFormAction.action);
  }
}
