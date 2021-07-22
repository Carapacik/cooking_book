import 'package:flutter/material.dart';

class StepNotifier extends ChangeNotifier {
  List<String> _stepList = [""];

  List<String> get stepList => _stepList;

  addStep() {
    _stepList.add("");
    notifyListeners();
  }

  deleteStep(int index) {
    _stepList.removeAt(index);
    notifyListeners();
  }
}
