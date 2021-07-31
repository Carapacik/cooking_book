import 'package:flutter/material.dart';
import 'package:recipebook/models/recipe_item.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/outlined_button.dart';
import 'package:recipebook/widgets/recipe_image_with_author.dart';

class RecipeItemWidget extends StatelessWidget {
  RecipeItemWidget({Key? key}) : super(key: key);

  final RecipeItem _recipeItem = RecipeItem(
    recipeId: 0,
    title: "Клубничная панна-котта",
    description:
        "Десерт, который невероятно легко и быстро готовится. Советую подавать его порционно в красивых бокалах, украсив взбитыми сливками, свежими ягодами и мятой.",
    imageUrl: "https://eda.ru/img/eda/c620x415/s1.eda.ru/StaticContent/Photos/120131083619/170816150250/p_O.jpg",
    username: "@horilka",
    tags: ["десерты", "клубника", "сливки"],
    favoritesCount: 10,
    likesCount: 8,
    cookingTimeInMinutes: 35,
    portionsCount: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(72),
          bottomLeft: Radius.circular(72),
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Palette.shadowColor,
            offset: Offset(0, 16),
            blurRadius: 72,
          )
        ],
      ),
      child: Row(
        children: [
          RecipeImageWithAuthor(
            imageUrl: _recipeItem.imageUrl,
            username: _recipeItem.username,
            size: 430,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 36, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Palette.orange.withOpacity(0.2),
                          ),
                          child: Text(
                            _recipeItem.tags[0],
                            style: Theme.of(context).textTheme.r14.copyWith(color: Palette.orange),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Palette.orange.withOpacity(0.2),
                          ),
                          child: Text(
                            _recipeItem.tags[1],
                            style: Theme.of(context).textTheme.r14.copyWith(color: Palette.orange),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Palette.orange.withOpacity(0.2),
                          ),
                          child: Text(
                            _recipeItem.tags[2],
                            style: Theme.of(context).textTheme.r14.copyWith(color: Palette.orange),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ButtonOutlinedWidget(
                          text: _recipeItem.favoritesCount.toString(),
                          width: 107,
                          height: 50,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 15),
                        ButtonOutlinedWidget(
                          text: _recipeItem.likesCount.toString(),
                          width: 107,
                          height: 50,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 34),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _recipeItem.title,
                      style: Theme.of(context).textTheme.b24,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 600,
                      child: Text(
                        _recipeItem.description,
                        style: Theme.of(context).textTheme.r18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
