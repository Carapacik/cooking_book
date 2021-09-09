import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<CategoryListState> buildEffect() {
  return combineEffects(<Object, Effect<CategoryListState>>{
    CategoryListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CategoryListState> ctx) {}
