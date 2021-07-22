import 'package:flutter/material.dart';
import 'package:recipebook/models/ingredient.dart';

class IngredientNotifier extends ChangeNotifier {
  List<Ingredient> _ingredientList = [
    Ingredient(title: "", ingredientNames: [])
  ];

  List<Ingredient> get ingredientList => _ingredientList;

  addNewIngredient() {
    _ingredientList.add(Ingredient(title: "", ingredientNames: []));
    notifyListeners();
  }

  deleteIngredient(int index) {
    //_ingredientList.removeWhere((item) => item.title == _ingredientList[index].title);
    _ingredientList.removeAt(index);
    notifyListeners();
  }
}
