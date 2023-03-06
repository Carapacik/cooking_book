import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/notifier/recipe_notifier.dart';
import 'package:recipe_book_flutter/theme.dart';
import 'package:recipe_book_flutter/widgets/recipe_item_widget.dart';

class RecipeListWidget extends StatelessWidget {
  const RecipeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeNotifier = Provider.of<RecipeNotifier>(context);

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
            separatorBuilder: (context, index) {
              return const SizedBox(height: 40);
            },
          )
        else
          Text(
            recipeNotifier.resultString,
            style: Theme.of(context).textTheme.m24,
          )
      ],
    );
  }
}
