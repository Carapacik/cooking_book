import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/controllers/ingredient_notifier.dart';
import 'package:recipebook/recipes/components/ingredient_item_widget.dart';

class IngredientListWidget extends StatelessWidget {
  const IngredientListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IngredientNotifier ingredientNotifier =
        Provider.of<IngredientNotifier>(context);

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
