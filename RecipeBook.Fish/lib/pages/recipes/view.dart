import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/widgets/button_contained.dart';

import 'state.dart';

Widget buildView(RecipesState state, Dispatch dispatch, ViewService viewService) {
  final headerWidget = viewService.buildComponent('header_widget');
  final categoryList = viewService.buildComponent('category_list');
  final searchBar = viewService.buildComponent('search_bar');

  return Scaffold(
    body: SizedBox(
      width: 1200,
      child: Column(
        children: [
          headerWidget,
          const SizedBox(height: 50),
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
          Center(child: Text("Тут рецепты")),
        ],
      ),
    ),
  );
}
