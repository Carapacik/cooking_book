import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/components/header_widget/state.dart';
import 'package:recipebook/pages/home_page/state.dart';
import 'package:recipebook/pages/recipes_page/state.dart';

class MainState implements Cloneable<MainState> {
  late HeaderWidgetState headerWidgetState;
  late RecipesState recipesState;
  late HomeState homeState;

  @override
  MainState clone() {
    return MainState()
      ..headerWidgetState = headerWidgetState
      ..recipesState = recipesState
      ..homeState = homeState;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState()
    ..headerWidgetState = HeaderWidgetState.initial()
    ..recipesState = RecipesState.initial()
    ..homeState = HomeState.initial();
}
