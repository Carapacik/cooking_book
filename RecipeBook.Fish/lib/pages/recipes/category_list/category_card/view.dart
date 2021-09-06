import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(CategoryCardState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: 278,
    child: Column(
      children: [
        Text("Название"),
        Text("Описание"),
      ],
    ),
  );
}
