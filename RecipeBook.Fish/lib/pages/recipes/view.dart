import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(RecipesState state, Dispatch dispatch, ViewService viewService) {
  final headerWidget = viewService.buildComponent('header_widget');
  final categoryListWidget = viewService.buildComponent('category_list');

  return Scaffold(
    body: Column(
      children: [
        headerWidget,
        const SizedBox(height: 20),
        categoryListWidget,
        const SizedBox(height: 20),
        Center(child: ElevatedButton(onPressed: () {}, child: Text("На главную"))),
      ],
    ),
  );
}
