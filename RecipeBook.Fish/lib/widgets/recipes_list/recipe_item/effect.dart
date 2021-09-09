import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecipeItemState> buildEffect() {
  return combineEffects(<Object, Effect<RecipeItemState>>{
    RecipeItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecipeItemState> ctx) {}
