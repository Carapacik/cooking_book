import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<StepInputsState> buildEffect() {
  return combineEffects(<Object, Effect<StepInputsState>>{
    StepInputsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<StepInputsState> ctx) {}
