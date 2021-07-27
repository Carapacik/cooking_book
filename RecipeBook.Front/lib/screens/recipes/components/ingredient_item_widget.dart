import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/controllers/ingredient_notifier.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';

class IngredientItemWidget extends StatelessWidget {
  IngredientItemWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    IngredientNotifier ingredientNotifier = Provider.of<IngredientNotifier>(context);

    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {
                ingredientNotifier.deleteIngredient(index);
              },
              icon: Icon(
                Icons.close,
                color: Palette.grey.withOpacity(0.4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 36),
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
          child: Column(
            children: [
              FormTextFieldWidget(
                hintText: "Заголовок для ингридиентов",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Не должно быть пустым";
                  }

                  return null;
                },
                onSaved: (value) {
                  ingredientNotifier.ingredientList[index].title = value!;
                },
              ),
              const SizedBox(height: 20),
              FormTextFieldWidget(
                textarea: true,
                height: 230,
                hintText: "Список подуктов для категории",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Не должно быть пустым";
                  }

                  return null;
                },
                onSaved: (value) {
                  ingredientNotifier.ingredientList[index].ingredientNames = value!.trim().split(",");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
