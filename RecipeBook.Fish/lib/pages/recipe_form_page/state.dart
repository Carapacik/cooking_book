import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/state.dart';

class RecipeFormState implements Cloneable<RecipeFormState> {
  RecipeFormState();

  @override
  RecipeFormState clone() {
    return RecipeFormState();
  }

  factory RecipeFormState.initial() {
    return RecipeFormState();
  }
}

RecipeFormState initState(Map<String, dynamic> args) {
  return RecipeFormState();
}

class RecipeFormConnector extends ConnOp<MainState, RecipeFormState> {
  @override
  RecipeFormState get(MainState state) => state.recipeFormState;

  @override
  void set(MainState state, RecipeFormState subState) => state.recipeFormState = subState;
}
