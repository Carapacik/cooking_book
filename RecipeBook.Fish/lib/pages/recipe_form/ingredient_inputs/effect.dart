import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<IngredientInputsState> buildEffect() {
  return combineEffects(<Object, Effect<IngredientInputsState>>{
    IngredientInputsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<IngredientInputsState> ctx) {}
