import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecipeListState> buildEffect() {
  return combineEffects(<Object, Effect<RecipeListState>>{
    RecipeListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecipeListState> ctx) {}
