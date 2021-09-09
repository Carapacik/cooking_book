import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/recipes_page/state.dart';

class RecipesListState implements Cloneable<RecipesListState> {
  @override
  RecipesListState clone() {
    return RecipesListState();
  }
}

RecipesListState initState(Map<String, dynamic> args) {
  return RecipesListState();
}

class RecipesListConnector extends ConnOp<RecipesState, RecipesListState> {
  @override
  RecipesListState get(RecipesState state) => state.recipesListState;

  @override
  void set(RecipesState state, RecipesListState subState) => state.recipesListState = subState;
}
