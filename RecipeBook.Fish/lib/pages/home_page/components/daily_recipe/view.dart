import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/pages/home_page/components/daily_recipe/state.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/recipe_image_with_author.dart';

Widget buildView(DailyRecipeState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(72),
              bottomRight: Radius.circular(72),
            ),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: RecipeImageWithAuthor(
          imageUrl: "",
          username: "carapacik",
          size: 543,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 62),
        width: 513,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.favorite_outline,
                  color: Palette.grey,
                  size: 20,
                ),
                const SizedBox(width: 7),
                Text(
                  365.toString(),
                  style: Theme.of(viewService.context).textTheme.r16,
                ),
                const SizedBox(width: 27),
                const Icon(
                  Icons.timer,
                  size: 20,
                  color: Palette.grey,
                ),
                const SizedBox(width: 7),
                Text(
                  "35 минут",
                  style: Theme.of(viewService.context).textTheme.r16,
                ),
              ],
            ),
            SvgPicture.asset(
              AppIcons.recipeOfDay,
              height: 95,
            ),
            const SizedBox(height: 32),
            Text(
              "Тыквенный супчик на кокосовом молоке",
              style: Theme.of(viewService.context).textTheme.b42,
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            Text(
              "Если у вас осталась тыква, и вы не знаете что с ней сделать, то это решение для вас! Ароматный, согревающий суп-пюре на кокосовом молоке.",
              style: Theme.of(viewService.context).textTheme.r18,
            ),
          ],
        ),
      ),
    ],
  );
}
