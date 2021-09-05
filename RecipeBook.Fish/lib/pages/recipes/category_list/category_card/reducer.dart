import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CategoryCardState> buildReducer() {
  return asReducer(
    <Object, Reducer<CategoryCardState>>{
      CategoryCardAction.action: _onAction,
    },
  );
}

CategoryCardState _onAction(CategoryCardState state, Action action) {
  final CategoryCardState newState = state.clone();
  return newState;
}
