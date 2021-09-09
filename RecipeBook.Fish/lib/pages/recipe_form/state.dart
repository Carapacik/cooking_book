import 'package:fish_redux/fish_redux.dart';

class RecipeFormState implements Cloneable<RecipeFormState> {
  @override
  RecipeFormState clone() {
    return RecipeFormState();
  }
}

RecipeFormState initState(Map<String, dynamic> args) {
  return RecipeFormState();
}
