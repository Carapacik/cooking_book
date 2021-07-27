import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/controllers/step_notifier.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipebook/theme.dart';

class StepItemWidget extends StatelessWidget {
  const StepItemWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    StepNotifier stepNotifier = Provider.of<StepNotifier>(context);

    return Container(
      width: 790,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 70),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Шаг ${index + 1}",
                style: Theme.of(context).textTheme.r18.copyWith(fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {
                  stepNotifier.deleteStep(index);
                },
                icon: Icon(
                  Icons.close,
                  color: Palette.grey.withOpacity(0.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 21),
          FormTextFieldWidget(
            textarea: true,
            height: 170,
            hintText: "Описание шага",
            validator: (value) {
              if (value!.isEmpty) {
                return "Не должно быть пустым";
              }

              return null;
            },
            onSaved: (value) {
              stepNotifier.stepList[index] = value!;
            },
          ),
        ],
      ),
    );
  }
}
