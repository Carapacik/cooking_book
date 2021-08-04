import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/notifier/recipe_notifier.dart';
import 'package:recipebook/screens/recipes/components/recipe_item_widget.dart';
import 'package:recipebook/theme.dart';

class RecipeListWidget extends StatelessWidget {
  const RecipeListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RecipeNotifier recipeNotifier = Provider.of<RecipeNotifier>(context);

    return Column(
      children: [
        if (recipeNotifier.recipeList.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            itemCount: recipeNotifier.recipeList.length,
            itemBuilder: (context, index) {
              return RecipeItemWidget(
                recipeItem: recipeNotifier.recipeList[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 40);
            },
          )
        else
          Text(
            "Результатов не найдено",
            style: Theme.of(context).textTheme.m24,
          )
      ],
    );
  }
}
