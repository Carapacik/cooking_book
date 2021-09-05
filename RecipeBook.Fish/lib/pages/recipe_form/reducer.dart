import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecipeFormState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecipeFormState>>{
      RecipeFormAction.action: _onAction,
    },
  );
}

RecipeFormState _onAction(RecipeFormState state, Action action) {
  final RecipeFormState newState = state.clone();
  return newState;
}
