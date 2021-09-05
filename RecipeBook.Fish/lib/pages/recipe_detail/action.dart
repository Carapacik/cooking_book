import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecipeDetailAction { action }

class RecipeDetailActionCreator {
  static Action onAction() {
    return const Action(RecipeDetailAction.action);
  }
}
