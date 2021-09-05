import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecipesListAction { action }

class RecipesListActionCreator {
  static Action onAction() {
    return const Action(RecipesListAction.action);
  }
}
