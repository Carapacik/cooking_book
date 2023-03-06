import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/model/ingredient.dart';

class IngredientNotifier extends ChangeNotifier {
  List<Ingredient> _ingredientList = [
    Ingredient(title: '', ingredientNames: [])
  ];

  List<Ingredient> get ingredientList => _ingredientList;

  List<Ingredient> replaceList(List<Ingredient> newList) =>
      _ingredientList = newList;

  void addNewIngredient() {
    _ingredientList.add(Ingredient(title: '', ingredientNames: []));
    notifyListeners();
  }

  void deleteIngredient(int index) {
    _ingredientList.removeAt(index);
    notifyListeners();
  }

  void clearList() {
    _ingredientList = [Ingredient(title: '', ingredientNames: [])];
  }
}
