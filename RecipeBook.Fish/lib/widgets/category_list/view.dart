import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/widgets/category_list/components/category_card.dart';

import 'state.dart';

Widget buildView(CategoryListState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CategoryCardWidget(
        iconPath: AppIcons.menu,
        title: "Простые блюда",
        searchQuery: "простое",
        description: "Время приготвления таких блюд не более 1 часа",
      ),
      CategoryCardWidget(
        iconPath: AppIcons.cook,
        title: "Детское",
        searchQuery: "детское",
        description: "Самые полезные блюда которые можно детям любого возраста",
      ),
      CategoryCardWidget(
        iconPath: AppIcons.chef,
        title: "От шеф-поваров",
        searchQuery: "шеф-повар",
        description: "Требуют умения, времени и терпения, зато как в ресторане",
      ),
      CategoryCardWidget(
        iconPath: AppIcons.confetti,
        title: "На праздник",
        searchQuery: "праздник",
        description: "Чем удивить гостей, чтобы все были сыты за праздничным столом",
      ),
    ],
  );
}
