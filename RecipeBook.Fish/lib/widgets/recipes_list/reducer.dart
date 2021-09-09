import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecipeListState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecipeListState>>{
      RecipeListAction.action: _onAction,
    },
  );
}

RecipeListState _onAction(RecipeListState state, Action action) {
  final RecipeListState newState = state.clone();
  return newState;
}
