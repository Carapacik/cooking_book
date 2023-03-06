import 'package:flutter/material.dart';

class StepNotifier extends ChangeNotifier {
  List<String> _stepList = [''];

  List<String> get stepList => _stepList;

  List<String> replaceList(List<String> newList) => _stepList = newList;

  void addStep() {
    _stepList.add('');
    notifyListeners();
  }

  void deleteStep(int index) {
    _stepList.removeAt(index);
    notifyListeners();
  }

  void clearList() {
    _stepList = [''];
  }
}
