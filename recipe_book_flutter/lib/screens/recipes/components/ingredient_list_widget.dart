import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/notifier/ingredient_notifier.dart';
import 'package:recipe_book_flutter/screens/recipes/components/ingredient_item_widget.dart';

class IngredientListWidget extends StatelessWidget {
  const IngredientListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ingredientNotifier = Provider.of<IngredientNotifier>(context);

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: ingredientNotifier.ingredientList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: IngredientItemWidget(index: index),
          ),
        ),
      ],
    );
  }
}
