import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<DailyRecipeState> buildEffect() {
  return combineEffects(<Object, Effect<DailyRecipeState>>{
    DailyRecipeAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DailyRecipeState> ctx) {}
