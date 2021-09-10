import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/state.dart';

class RecipeDetailState implements Cloneable<RecipeDetailState> {
  RecipeDetailState();

  @override
  RecipeDetailState clone() {
    return RecipeDetailState();
  }

  factory RecipeDetailState.initial() {
    return RecipeDetailState();
  }
}

RecipeDetailState initState(Map<String, dynamic> args) {
  return RecipeDetailState();
}

class RecipeDetailConnector extends ConnOp<MainState, RecipeDetailState> {
  @override
  RecipeDetailState get(MainState state) => state.recipeDetailState;

  @override
  void set(MainState state, RecipeDetailState subState) => state.recipeDetailState = subState;
}
