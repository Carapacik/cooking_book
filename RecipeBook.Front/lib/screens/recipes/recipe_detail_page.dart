import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/model/ingredient.dart';
import 'package:recipebook/model/recipe_detail.dart';
import 'package:recipebook/model/recipe_item.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/recipe_item_widget.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/header_widget.dart';
import 'package:recipebook/widgets/outlined_button.dart';

class RecipeDetailPage extends StatelessWidget {
  RecipeDetailPage({
    Key? key,
    required this.recipeId,
  }) : super(key: key);

  final String recipeId;

  final RecipeDetail recipeDetail = RecipeDetail(
    recipeId: 1,
    title: "Клубничная панна-котта",
    description:
        "Десерт, который невероятно легко и быстро готовится. Советую подавать его порционно в красивых бокалах, украсив взбитыми сливками, свежими ягодами и мятой.",
    imageUrl: "49eb8e8b-476f-4404-b2ff-deecab0e699e.png",
    username: "@дод",
    tags: ["десерты", "клубника", "сливки"],
    favoritesCount: 10,
    likesCount: 8,
    cookingTimeInMinutes: 35,
    portionsCount: 5,
    steps: [
      "Приготовим панна котту: Зальем желатин молоком и поставим на 30 минут для набухания. В сливки добавим сахар и ванильный сахар. Доводим до кипения (не кипятим!)."
    ],
    ingredients: [
      Ingredient(
        title: "Для панна котты",
        ingredientNames: [
          "Сливки-20-30% - 500мл",
          "Молоко - 100мл.",
          "Желатин - 2ч.л.",
        ],
      ),
      Ingredient(
        title: "Для клубничного желе",
        ingredientNames: [
          "Сливки-20-30% - 500мл",
          "Молоко - 100мл.",
          "Желатин - 2ч.л.",
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          SvgPicture.asset(
            CookingImages.wave1,
            color: Palette.wave,
            width: MediaQuery.of(context).size.width,
          ),
          const HeaderWidget(currentSelectedPage: HeaderButtons.recipes),
          Padding(
            padding: const EdgeInsets.only(top: 127, left: 120, right: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    context.beamBack();
                  },
                  style: TextButton.styleFrom(primary: Palette.orange),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        size: 18,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Назад",
                        style: Theme.of(context).textTheme.n18,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      recipeDetail.title,
                      style: Theme.of(context).textTheme.b42,
                    ),
                    Row(
                      children: [
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
                          onPressed: () => context.beamToNamed("/recipes/$recipeId/edit"),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                RecipeItemWidget(
                  isDetail: true,
                  recipeItem: RecipeItem(
                    recipeId: recipeDetail.recipeId,
                    title: recipeDetail.title,
                    description: recipeDetail.description,
                    imageUrl: recipeDetail.imageUrl,
                    username: recipeDetail.username,
                    tags: recipeDetail.tags,
                    favoritesCount: recipeDetail.favoritesCount,
                    likesCount: recipeDetail.likesCount,
                    cookingTimeInMinutes: recipeDetail.cookingTimeInMinutes,
                    portionsCount: recipeDetail.portionsCount,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 396,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ингредиенты",
                            style: Theme.of(context).textTheme.b20.copyWith(color: Palette.orange),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: recipeDetail.ingredients.length,
                            itemBuilder: (context, index) {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: recipeDetail.ingredients[index].ingredientNames.length + 1,
                                itemBuilder: (context, id) {
                                  if (id == 0) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        recipeDetail.ingredients[index].title,
                                        style: Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten1),
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      recipeDetail.ingredients[index].ingredientNames[id - 1],
                                      style: Theme.of(context).textTheme.r18,
                                    );
                                  }
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(height: 10);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 16),
                            blurRadius: 72,
                            color: Palette.shadowColor,
                          )
                        ],
                      ),
                      width: 790,
                      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 73),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Шаг 1",
                            style: Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten1),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            recipeDetail.steps[0],
                            style: Theme.of(context).textTheme.r18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
