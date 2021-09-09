import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/recipes_page/state.dart';

class RecipeListState implements Cloneable<RecipeListState> {
  @override
  RecipeListState clone() {
    return RecipeListState();
  }
}

RecipeListState initState(Map<String, dynamic> args) {
  return RecipeListState();
}

class RecipeListConnector extends ConnOp<RecipesState, RecipeListState> {
  @override
  RecipeListState get(RecipesState state) => state.recipesListState;

  @override
  void set(RecipesState state, RecipeListState subState) => state.recipesListState = subState;
}
