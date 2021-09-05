import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HeaderWidgetState state, Dispatch dispatch, ViewService viewService) {
  return Row(children: [
    ElevatedButton(onPressed: () {}, child: Text("Recipes")),
    ElevatedButton(onPressed: () {}, child: Text("Главная")),
    ElevatedButton(onPressed: () {}, child: Text("Рецепты")),
    ElevatedButton(onPressed: () {}, child: Text("Избранное")),
    ElevatedButton(onPressed: () {}, child: Text("Войти")),
  ],);
}
