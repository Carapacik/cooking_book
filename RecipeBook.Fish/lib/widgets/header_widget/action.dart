import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HeaderWidgetAction { action }

class HeaderWidgetActionCreator {
  static Action onAction() {
    return const Action(HeaderWidgetAction.action);
  }
}
