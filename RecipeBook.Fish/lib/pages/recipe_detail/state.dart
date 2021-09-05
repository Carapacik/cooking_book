import 'package:fish_redux/fish_redux.dart';

class RecipeDetailState implements Cloneable<RecipeDetailState> {

  @override
  RecipeDetailState clone() {
    return RecipeDetailState();
  }
}

RecipeDetailState initState(Map<String, dynamic> args) {
  return RecipeDetailState();
}
