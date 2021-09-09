import 'package:fish_redux/fish_redux.dart';

class RecipeItemState implements Cloneable<RecipeItemState> {
  @override
  RecipeItemState clone() {
    return RecipeItemState();
  }
}

RecipeItemState initState(Map<String, dynamic> args) {
  return RecipeItemState();
}
