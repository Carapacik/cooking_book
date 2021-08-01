import 'package:flutter/material.dart';
import 'package:recipebook/models/recipe_item.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/outlined_button.dart';
import 'package:recipebook/widgets/recipe_image_with_author.dart';

class RecipeItemWidget extends StatelessWidget {
  RecipeItemWidget({Key? key, required this.recipeItem}) : super(key: key);

  final RecipeItem recipeItem;

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
            imageUrl: recipeItem.imageUrl,
            username: recipeItem.username,
            size: 430,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 36, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 770,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecipeTagsList(tags: recipeItem.tags),
                      Row(
                        children: [
                          ButtonOutlinedWidget(
                            icon: Icons.star,
                            padding: 12,
                            text: recipeItem.favoritesCount.toString(),
                            width: 107,
                            height: 50,
                            onPressed: () {},
                          ),
                          const SizedBox(width: 15),
                          ButtonOutlinedWidget(
                            icon: Icons.favorite_outline,
                            padding: 12,
                            text: recipeItem.likesCount.toString(),
                            width: 107,
                            height: 50,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 34),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipeItem.title,
                      style: Theme.of(context).textTheme.b24,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 600,
                      child: Text(
                        recipeItem.description,
                        style: Theme.of(context).textTheme.r18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 460,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.timer,
                            size: 64,
                          ),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Время приготовления:",
                                style: Theme.of(context).textTheme.r14,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${recipeItem.cookingTimeInMinutes} мин",
                                style: Theme.of(context).textTheme.r16.copyWith(color: Palette.main),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.people_outline,
                            size: 64,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Рецепт на:",
                                style: Theme.of(context).textTheme.r14,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${recipeItem.portionsCount} персон",
                                style: Theme.of(context).textTheme.r16.copyWith(color: Palette.main),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeTagsList extends StatelessWidget {
  const RecipeTagsList({
    Key? key,
    required this.tags,
  }) : super(key: key);

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Palette.orange.withOpacity(0.2),
          ),
          child: Text(
            tags[0],
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
            tags[1],
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
            tags[2],
            style: Theme.of(context).textTheme.r14.copyWith(color: Palette.orange),
          ),
        ),
      ],
    );
  }
}
