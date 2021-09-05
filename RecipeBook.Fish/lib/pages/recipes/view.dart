import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(RecipesState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Column(
      children: [
        Center(child: ElevatedButton(onPressed: () {}, child: Text("На главную"))),

      ],
    ),
  );
}
