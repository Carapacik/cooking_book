import 'package:fish_redux/fish_redux.dart';

class CategoryCardState implements Cloneable<CategoryCardState> {

  @override
  CategoryCardState clone() {
    return CategoryCardState();
  }
}

CategoryCardState initState(Map<String, dynamic> args) {
  return CategoryCardState();
}
