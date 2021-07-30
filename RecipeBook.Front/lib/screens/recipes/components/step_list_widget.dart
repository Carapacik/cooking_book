import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/controllers/step_notifier.dart';
import 'package:recipebook/screens/recipes/components/step_item_widget.dart';

class StepListWidget extends StatelessWidget {
  const StepListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StepNotifier stepNotifier = Provider.of<StepNotifier>(context);

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: stepNotifier.stepList.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: StepItemWidget(index: index),
          ),
        ),
      ],
    );
  }
}
