import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecipesState> buildEffect() {
  return combineEffects(<Object, Effect<RecipesState>>{
    RecipesAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecipesState> ctx) {}
