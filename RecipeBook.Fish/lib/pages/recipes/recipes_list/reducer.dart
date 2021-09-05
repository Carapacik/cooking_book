import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecipesListState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecipesListState>>{
      RecipesListAction.action: _onAction,
    },
  );
}

RecipesListState _onAction(RecipesListState state, Action action) {
  final RecipesListState newState = state.clone();
  return newState;
}
