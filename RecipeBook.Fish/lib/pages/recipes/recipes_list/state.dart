import 'package:fish_redux/fish_redux.dart';

class RecipesListState implements Cloneable<RecipesListState> {

  @override
  RecipesListState clone() {
    return RecipesListState();
  }
}

RecipesListState initState(Map<String, dynamic> args) {
  return RecipesListState();
}
