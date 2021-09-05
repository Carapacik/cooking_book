import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IngredientInputsState> buildReducer() {
  return asReducer(
    <Object, Reducer<IngredientInputsState>>{
      IngredientInputsAction.action: _onAction,
    },
  );
}

IngredientInputsState _onAction(IngredientInputsState state, Action action) {
  final IngredientInputsState newState = state.clone();
  return newState;
}
