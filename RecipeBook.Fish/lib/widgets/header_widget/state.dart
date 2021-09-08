import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/recipes/state.dart';

class HeaderWidgetState implements Cloneable<HeaderWidgetState> {
  @override
  HeaderWidgetState clone() {
    return HeaderWidgetState();
  }
}

HeaderWidgetState initState(Map<String, dynamic> args) {
  return HeaderWidgetState();
}

class HeaderWidgetConnector extends ConnOp<RecipesState, HeaderWidgetState> {
  @override
  HeaderWidgetState get(RecipesState state) => state.headerWidgetState;

  @override
  void set(RecipesState state, HeaderWidgetState subState) => state.headerWidgetState = subState;
}
