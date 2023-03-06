import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/notifier/ingredient_notifier.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/screens/recipes/components/form_text_field_widget.dart';

class IngredientItemWidget extends StatefulWidget {
  const IngredientItemWidget({required this.index, super.key});

  final int index;

  @override
  State<IngredientItemWidget> createState() => _IngredientItemWidgetState();
}

class _IngredientItemWidgetState extends State<IngredientItemWidget> {
  TextEditingController? titleController;

  TextEditingController? itemsController;

  @override
  Widget build(BuildContext context) {
    final ingredientNotifier = Provider.of<IngredientNotifier>(context);
    if (ingredientNotifier.ingredientList[widget.index].title != '') {
      titleController = TextEditingController();
      itemsController = TextEditingController();
      titleController!.text =
          ingredientNotifier.ingredientList[widget.index].title;
      itemsController!.text = ingredientNotifier
          .ingredientList[widget.index].ingredientNames
          .join('\n');
    }

    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: SizedBox()),
            IconButton(
              splashRadius: 1,
              splashColor: Colors.transparent,
              onPressed: () {
                ingredientNotifier.deleteIngredient(widget.index);
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
                controller: titleController,
                hintText: 'Заголовок для ингридиентов',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Не должно быть пустым';
                  }
                  return null;
                },
                onSaved: (value) {
                  ingredientNotifier.ingredientList[widget.index].title =
                      value!;
                },
              ),
              const SizedBox(height: 20),
              FormTextFieldWidget(
                controller: itemsController,
                textarea: true,
                height: 230,
                hintText: 'Список подуктов для категории',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Не должно быть пустым';
                  }
                  return null;
                },
                onSaved: (value) {
                  ingredientNotifier.ingredientList[widget.index]
                      .ingredientNames = value!.trim().split('\n');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
