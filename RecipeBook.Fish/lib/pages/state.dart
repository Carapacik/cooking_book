import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/components/header_widget/state.dart';
import 'package:recipebook/pages/recipes_page/state.dart';

class MainState implements Cloneable<MainState> {
  late HeaderWidgetState headerWidgetState;
  late RecipesState recipesState;

  @override
  MainState clone() {
    return MainState()
      ..headerWidgetState = headerWidgetState
      ..recipesState = recipesState;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState()
    ..headerWidgetState = HeaderWidgetState.initial()
    ..recipesState = RecipesState.initial();
}
