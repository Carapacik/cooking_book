import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecipesAction { action }

class RecipesActionCreator {
  static Action onAction() {
    return const Action(RecipesAction.action);
  }
}
