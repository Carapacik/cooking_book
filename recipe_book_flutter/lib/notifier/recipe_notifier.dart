import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/model/recipe_item.dart';

class RecipeNotifier extends ChangeNotifier {
  final List<RecipeItem> _recipeList = [];
  String resultString = 'Идёт загрузка...';

  UnmodifiableListView<RecipeItem> get recipeList =>
      UnmodifiableListView(_recipeList);

  void addClearRecipes(List<dynamic> data) {
    _recipeList.clear();
    addRecipes(data);
  }

  void addRecipes(List<dynamic> data) {
    for (final item in data) {
      _recipeList.add(RecipeItem.fromJson(item as Map<String, dynamic>));
    }
    notifyListeners();
  }

  void removeItem(int recipeId) {
    _recipeList.removeWhere((item) => item.recipeId == recipeId);
    notifyListeners();
  }
}
