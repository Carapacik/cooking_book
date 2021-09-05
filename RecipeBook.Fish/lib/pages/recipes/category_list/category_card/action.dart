import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CategoryCardAction { action }

class CategoryCardActionCreator {
  static Action onAction() {
    return const Action(CategoryCardAction.action);
  }
}
