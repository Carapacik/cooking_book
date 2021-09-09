import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/models/app_user.dart';

abstract class GlobalBaseState {
  AppUser? get user;

  set user(AppUser? newUser);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  AppUser? user;

  @override
  GlobalState clone() {
    return GlobalState()..user = user;
  }
}
