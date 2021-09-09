import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecipeItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecipeItemState>>{
      RecipeItemAction.action: _onAction,
    },
  );
}

RecipeItemState _onAction(RecipeItemState state, Action action) {
  final RecipeItemState newState = state.clone();
  return newState;
}
