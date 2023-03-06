import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/notifier/step_notifier.dart';
import 'package:recipe_book_flutter/screens/recipes/components/step_item_widget.dart';

class StepListWidget extends StatelessWidget {
  const StepListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final stepNotifier = Provider.of<StepNotifier>(context);

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: stepNotifier.stepList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: StepItemWidget(index: index),
          ),
        ),
      ],
    );
  }
}
