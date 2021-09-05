import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainInputsState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainInputsState>>{
      MainInputsAction.action: _onAction,
    },
  );
}

MainInputsState _onAction(MainInputsState state, Action action) {
  final MainInputsState newState = state.clone();
  return newState;
}
