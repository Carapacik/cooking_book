import 'package:fish_redux/fish_redux.dart';

enum DailyRecipeAction { action }

class DailyRecipeActionCreator {
  static Action onAction() {
    return const Action(DailyRecipeAction.action);
  }
}
