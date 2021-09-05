import 'package:fish_redux/fish_redux.dart';

class CategoryListState implements Cloneable<CategoryListState> {
  @override
  CategoryListState clone() {
    return CategoryListState();
  }
}

CategoryListState initState(Map<String, dynamic> args) {
  return CategoryListState();
}
