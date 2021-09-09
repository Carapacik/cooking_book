import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/widgets/button_contained.dart';

import 'state.dart';

Widget buildView(RecipesState state, Dispatch dispatch, ViewService viewService) {
  final categoryList = viewService.buildComponent('category_list');
  final searchBar = viewService.buildComponent('search_bar');
  final recipeList = viewService.buildComponent('recipe_list');

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(height: 82),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Рецепты",
            // style: Theme.of(context).textTheme.b42,
          ),
          ButtonContainedWidget(
            icon: Icons.add,
            padding: 18,
            text: "Добавить рецепт",
            width: 278,
            height: 60,
            onPressed: () {},
          ),
        ],
      ),
      const SizedBox(height: 50),
      categoryList,
      const SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Поиск рецепта",
            //style: Theme.of(context).textTheme.b24,
          ),
          searchBar,
        ],
      ),
      const SizedBox(height: 80),
      recipeList,
    ],
  );
}
