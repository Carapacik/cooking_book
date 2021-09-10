import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/home_page/components/daily_recipe/action.dart';

import 'state.dart';

Reducer<DailyRecipeState> buildReducer() {
  return asReducer(
    <Object, Reducer<DailyRecipeState>>{
      DailyRecipeAction.action: _onAction,
    },
  );
}

DailyRecipeState _onAction(DailyRecipeState state, Action action) {
  final DailyRecipeState newState = state.clone();
  return newState;
}
