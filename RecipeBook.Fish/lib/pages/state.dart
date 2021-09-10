import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/components/header_widget/state.dart';
import 'package:recipebook/pages/home_page/state.dart';
import 'package:recipebook/pages/recipe_detail_page/state.dart';
import 'package:recipebook/pages/recipe_form_page/state.dart';
import 'package:recipebook/pages/recipes_page/state.dart';

class MainState implements Cloneable<MainState> {
  late HeaderWidgetState headerWidgetState;
  late HomeState homeState;
  late RecipesState recipesState;
  late RecipeDetailState recipeDetailState;
  late RecipeFormState recipeFormState;

  @override
  MainState clone() {
    return MainState()
      ..headerWidgetState = headerWidgetState
      ..homeState = homeState
      ..recipesState = recipesState
      ..recipeDetailState = recipeDetailState
      ..recipeFormState = recipeFormState;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState()
    ..headerWidgetState = HeaderWidgetState.initial()
    ..homeState = HomeState.initial()
    ..recipesState = RecipesState.initial()
    ..recipeDetailState = RecipeDetailState.initial()
    ..recipeFormState = RecipeFormState.initial();
}
