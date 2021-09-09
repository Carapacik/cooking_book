import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecipeItemAction { action }

class RecipeItemActionCreator {
  static Action onAction() {
    return const Action(RecipeItemAction.action);
  }
}
