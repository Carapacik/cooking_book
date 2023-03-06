import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/notifier/step_notifier.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/screens/recipes/components/form_text_field_widget.dart';
import 'package:recipe_book_flutter/theme.dart';

class StepItemWidget extends StatefulWidget {
  const StepItemWidget({required this.index, super.key});

  final int index;

  @override
  State<StepItemWidget> createState() => _StepItemWidgetState();
}

class _StepItemWidgetState extends State<StepItemWidget> {
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final stepNotifier = Provider.of<StepNotifier>(context);
    if (stepNotifier.stepList[widget.index] != '') {
      controller = TextEditingController();
      controller!.text = stepNotifier.stepList[widget.index];
    }

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
                'Шаг ${widget.index + 1}',
                style: Theme.of(context)
                    .textTheme
                    .r18
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {
                  stepNotifier.deleteStep(widget.index);
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
            controller: controller,
            textarea: true,
            height: 170,
            hintText: 'Описание шага',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Не должно быть пустым';
              }
              return null;
            },
            onSaved: (value) {
              stepNotifier.stepList[widget.index] = value!;
            },
          ),
        ],
      ),
    );
  }
}
