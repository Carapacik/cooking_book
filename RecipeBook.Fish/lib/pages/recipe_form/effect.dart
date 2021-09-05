import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecipeFormState> buildEffect() {
  return combineEffects(<Object, Effect<RecipeFormState>>{
    RecipeFormAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecipeFormState> ctx) {
}
