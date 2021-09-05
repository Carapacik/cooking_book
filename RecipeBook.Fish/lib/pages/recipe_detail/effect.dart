import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecipeDetailState> buildEffect() {
  return combineEffects(<Object, Effect<RecipeDetailState>>{
    RecipeDetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecipeDetailState> ctx) {
}
