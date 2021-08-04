import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:recipebook/model/recipe_item.dart';

class RecipeNotifier extends ChangeNotifier {
  List<RecipeItem> _recipeList = [];

  UnmodifiableListView<RecipeItem> get recipeList => UnmodifiableListView(_recipeList);

  addClearRecipes(List<dynamic> data) {
    _recipeList.clear();
    addRecipes(data);
  }

  addRecipes(List<dynamic> data) {
    for (final item in data) {
      _recipeList.add(RecipeItem.fromJson(item as Map<String, dynamic>));
    }
    notifyListeners();
  }

  removeItem(int recipeId) {
    _recipeList.removeWhere((item) => item.recipeId == recipeId);
    notifyListeners();
  }
}
