import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecipeDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecipeDetailState>>{
      RecipeDetailAction.action: _onAction,
    },
  );
}

RecipeDetailState _onAction(RecipeDetailState state, Action action) {
  final RecipeDetailState newState = state.clone();
  return newState;
}
