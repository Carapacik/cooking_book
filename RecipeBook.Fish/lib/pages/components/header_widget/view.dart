import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';

import 'state.dart';

Widget buildView(HeaderWidgetState state, Dispatch dispatch, ViewService viewService) {
  return SizedBox(
    height: 80,
    child: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.only(top: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Palette.orange),
              child: Text(
                "Recipes",
                style: Theme.of(viewService.context).textTheme.b24.copyWith(color: Palette.orange),
              ),
            ),
            const SizedBox(width: 80),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Palette.orange),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  HeaderButtons.getById(0).name,
                  style: Theme.of(viewService.context).textTheme.r18.copyWith(color: Palette.grey),
                  // style: widget.currentSelectedPage?.index == index
                  //     ? Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten2)
                  //     : Theme.of(context).textTheme.r18.copyWith(color: Palette.grey),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Palette.orange),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  HeaderButtons.getById(1).name,
                  style: Theme.of(viewService.context).textTheme.r18.copyWith(color: Palette.grey),
                  // style: widget.currentSelectedPage?.index == index
                  //     ? Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten2)
                  //     : Theme.of(context).textTheme.r18.copyWith(color: Palette.grey),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Palette.orange),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  HeaderButtons.getById(2).name,
                  style: Theme.of(viewService.context).textTheme.r18.copyWith(color: Palette.grey),
                  // style: widget.currentSelectedPage?.index == index
                  //     ? Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten2)
                  //     : Theme.of(context).textTheme.r18.copyWith(color: Palette.grey),
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(primary: Palette.orange),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.login,
                        width: 38,
                        height: 38,
                      ),
                      const SizedBox(width: 14),
                      Text(
                        "Войти",
                        style: Theme.of(viewService.context).textTheme.b18.copyWith(color: Palette.orange),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class HeaderButtons {
  final String name;
  final int index;
  final String route;

  const HeaderButtons._(this.name, this.index, this.route);

  static const home = HeaderButtons._("Главная", 0, '/');
  static const recipes = HeaderButtons._("Рецепты", 1, "/recipes");
  static const favorite = HeaderButtons._("Избранное", 2, "/favorite");

  static const values = [home, recipes, favorite];

  static HeaderButtons getById(final int id) {
    return values.firstWhere((button) => button.index == id);
  }
}
