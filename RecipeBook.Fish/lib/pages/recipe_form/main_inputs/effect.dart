import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<MainInputsState> buildEffect() {
  return combineEffects(<Object, Effect<MainInputsState>>{
    MainInputsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MainInputsState> ctx) {}
