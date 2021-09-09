import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/widgets/button_back.dart';
import 'package:recipebook/widgets/button_contained.dart';
import 'package:recipebook/widgets/button_outlined.dart';

import 'state.dart';

Widget buildView(RecipeDetailState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 48),
      ButtonBack(),
      const SizedBox(height: 11),
      _titlePart(),
      const SizedBox(height: 50),
      //RecipeItem
    ],
  );
}

Widget _titlePart() {
  return Row(
    children: [
      Expanded(
        child: Text(
          "Детайльный рецепт",
          //style: Theme.of(context).textTheme.b42,
        ),
      ),
      ButtonOutlinedWidget(
        text: "",
        width: 60,
        height: 60,
        icon: Icons.delete_outline,
        onPressed: () {},
      ),
      const SizedBox(width: 18),
      ButtonContainedWidget(
        text: "Редактировать",
        width: 278,
        height: 60,
        icon: Icons.edit,
        padding: 18,
        onPressed: () {},
      ),
    ],
  );
}
