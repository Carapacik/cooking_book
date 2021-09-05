import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HeaderWidgetState> buildReducer() {
  return asReducer(
    <Object, Reducer<HeaderWidgetState>>{
      HeaderWidgetAction.action: _onAction,
    },
  );
}

HeaderWidgetState _onAction(HeaderWidgetState state, Action action) {
  final HeaderWidgetState newState = state.clone();
  return newState;
}
