import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<StepInputsState> buildReducer() {
  return asReducer(
    <Object, Reducer<StepInputsState>>{
      StepInputsAction.action: _onAction,
    },
  );
}

StepInputsState _onAction(StepInputsState state, Action action) {
  final StepInputsState newState = state.clone();
  return newState;
}
