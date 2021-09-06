import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/models/app_user.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.setUser: _onSetUser,
    },
  );
}

GlobalState _onSetUser(GlobalState state, Action action) {
  final AppUser user = action.payload;
  return state.clone()..user = user;
}
