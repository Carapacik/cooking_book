import 'package:fish_redux/fish_redux.dart';

class RecipesState implements Cloneable<RecipesState> {

  @override
  RecipesState clone() {
    return RecipesState();
  }
}

RecipesState initState(Map<String, dynamic> args) {
  return RecipesState();
}
