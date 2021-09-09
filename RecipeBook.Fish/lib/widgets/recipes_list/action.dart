import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecipeListAction { action }

class RecipesListActionCreator {
  static Action onAction() {
    return const Action(RecipeListAction.action);
  }
}
