import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/models/app_user.dart';

//TODO replace with your own action
enum GlobalAction { setUser }

class GlobalActionCreator {
  static Action setUser(AppUser user) {
    return Action(GlobalAction.setUser, payload: user);
  }
}
