import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CategoryListState> buildReducer() {
  return asReducer(
    <Object, Reducer<CategoryListState>>{
      CategoryListAction.action: _onAction,
    },
  );
}

CategoryListState _onAction(CategoryListState state, Action action) {
  final CategoryListState newState = state.clone();
  return newState;
}
