import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/button_contained.dart';
import 'package:recipebook/widgets/button_outlined.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final categoryList = viewService.buildComponent('category_list');
  final dailyRecipe = viewService.buildComponent('daily_recipe');

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 133),
      _topPart(viewService),
      const SizedBox(height: 350),
      Text(
        "Умная сортировка по тегам",
        style: Theme.of(viewService.context).textTheme.b42,
      ),
      const SizedBox(height: 16),
      SizedBox(
        width: 700,
        child: Text(
          "Добавляй рецепты и указывай наиболее популярные теги. Это позволит быстро находить любые категории.",
          style: Theme.of(viewService.context).textTheme.r18,
        ),
      ),
      const SizedBox(height: 42),
      categoryList,
      const SizedBox(height: 157),
      dailyRecipe,
      const SizedBox(height: 150),
      _searchPart(state, viewService),
      const SizedBox(height: 148),
    ],
  );
}

Widget _topPart(ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 680,
        child: Text(
          "Готовь и делись рецептами",
          style: Theme.of(viewService.context).textTheme.b72,
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        width: 560,
        child: Text(
          "Никаких кулинарных книг и блокнотов! Храни все любимые рецепты в одном месте.",
          style: Theme.of(viewService.context).textTheme.r18,
        ),
      ),
      const SizedBox(height: 42),
      Row(
        children: [
          ButtonContainedWidget(
            icon: Icons.add,
            padding: 18,
            text: "Добавить рецепт",
            width: 278,
            height: 60,
            onPressed: () {},
          ),
          const SizedBox(width: 24),
          ButtonOutlinedWidget(
            text: "Войти",
            width: 216,
            height: 60,
            onPressed: () {},
          ),
        ],
      ),
    ],
  );
}

Widget _searchPart(HomeState state, ViewService viewService) {
  final searchBar = viewService.buildComponent('search_bar');

  return Center(
    child: Column(
      children: [
        Text(
          "Поиск рецептов",
          style: Theme.of(viewService.context).textTheme.b42,
        ),
        const SizedBox(height: 16),
        Text(
          "Введите примерное название блюда, а мы по тегам найдем его",
          style: Theme.of(viewService.context).textTheme.r18.copyWith(color: Palette.main),
        ),
        const SizedBox(height: 64),
        searchBar,
      ],
    ),
  );
}
