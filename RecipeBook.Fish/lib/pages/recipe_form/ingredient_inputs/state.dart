import 'package:fish_redux/fish_redux.dart';

class IngredientInputsState implements Cloneable<IngredientInputsState> {

  @override
  IngredientInputsState clone() {
    return IngredientInputsState();
  }
}

IngredientInputsState initState(Map<String, dynamic> args) {
  return IngredientInputsState();
}
