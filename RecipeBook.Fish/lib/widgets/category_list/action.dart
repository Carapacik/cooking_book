import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CategoryListAction { action }

class CategoryListActionCreator {
  static Action onAction() {
    return const Action(CategoryListAction.action);
  }
}
