import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SearchBarState state, Dispatch dispatch, ViewService viewService) {
  return Row(children: [
    TextFormField(),
    ElevatedButton(onPressed: () {}, child: Text("Поиск"))
  ],);
}
