import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(CategoryListState state, Dispatch dispatch, ViewService viewService) {
  final categoryCardWidget = viewService.buildComponent('category_card');
  return Row(
    children: [
      categoryCardWidget,
      categoryCardWidget,
    ],
  );
}
