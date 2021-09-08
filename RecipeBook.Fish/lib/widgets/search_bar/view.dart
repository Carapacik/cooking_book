import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/widgets/button_contained.dart';

import 'state.dart';

// передать ширину
Widget buildView(SearchBarState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: 73,
        width: 779,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Palette.shadowColor,
              offset: Offset(0, 8),
              blurRadius: 42,
            )
          ],
        ),
        child: TextField(
          cursorColor: Palette.orange,
          //style: Theme.of(context).textTheme.r18.copyWith(color: Palette.main),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Название блюда...",
            //hintStyle: Theme.of(context).textTheme.r16,
          ),
        ),
      ),
      const SizedBox(width: 16),
      ButtonContainedWidget(
        text: "Поиск",
        width: 152,
        height: 73,
        onPressed: () {},
      )
    ],
  );
}
