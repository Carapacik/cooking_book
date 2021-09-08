import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(CategoryCardState state, Dispatch dispatch, ViewService viewService) {
  return Container(child:
    ElevatedButton(onPressed: () {  }, child: Text("Перейти на категорию простое"),),);
}
