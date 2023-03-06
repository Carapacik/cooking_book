import 'package:flutter/material.dart';
import 'package:recipebook/model/ingredient.dart';

class IngredientNotifier extends ChangeNotifier {
  List<Ingredient> _ingredientList = [Ingredient(title: "", ingredientNames: [])];

  List<Ingredient> get ingredientList => _ingredientList;

  replaceList(List<Ingredient> newList) => _ingredientList = newList;

  addNewIngredient() {
    _ingredientList.add(Ingredient(title: "", ingredientNames: []));
    notifyListeners();
  }

  deleteIngredient(int index) {
    _ingredientList.removeAt(index);
    notifyListeners();
  }

  clearList(){
    _ingredientList = [Ingredient(title: "", ingredientNames: [])];
  }
}
