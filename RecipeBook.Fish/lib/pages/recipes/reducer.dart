import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecipesState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecipesState>>{
      RecipesAction.action: _onAction,
    },
  );
}

RecipesState _onAction(RecipesState state, Action action) {
  final RecipesState newState = state.clone();
  return newState;
}
