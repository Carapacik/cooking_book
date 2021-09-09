import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecipesListState> buildEffect() {
  return combineEffects(<Object, Effect<RecipesListState>>{
    RecipesListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecipesListState> ctx) {}
