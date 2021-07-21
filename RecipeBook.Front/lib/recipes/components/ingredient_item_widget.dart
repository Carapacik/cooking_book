
import 'package:flutter/material.dart';
import 'package:recipebook/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/resources/palette.dart';

class IngredientItemWidget extends StatelessWidget {
  const IngredientItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: SizedBox()),
            IconButton(
              splashRadius: 24,
              hoverColor: Palette.uploadPhotoBackground.withOpacity(0.4),
              onPressed: () {},
              icon: Icon(
                Icons.close,
                color: Palette.grey.withOpacity(0.4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 30, vertical: 36),
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
            children: const [
              FormTextFieldWidget(
                height: 50,
                hintText: "Заголовок для ингридиентов",
              ),
              SizedBox(height: 20),
              FormTextFieldWidget(
                textarea: true,
                height: 230,
                hintText: "Список подуктов для категории",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
