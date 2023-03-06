import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/notifier/ingredient_notifier.dart';
import 'package:recipebook/screens/recipes/components/ingredient_item_widget.dart';

class IngredientListWidget extends StatelessWidget {
  const IngredientListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IngredientNotifier ingredientNotifier = Provider.of<IngredientNotifier>(context);

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: ingredientNotifier.ingredientList.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: IngredientItemWidget(index: index),
          ),
        ),
      ],
    );
  }
}
