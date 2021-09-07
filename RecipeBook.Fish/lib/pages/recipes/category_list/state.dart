import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/recipes/category_list/category_card/state.dart';

class CategoryListState implements Cloneable<CategoryListState> {
  late CategoryCardState categoryCardState;

  @override
  CategoryListState clone() {
    return CategoryListState();
  }
}

CategoryListState initState(Map<String, dynamic> args) {
  return CategoryListState()
    ..categoryCardState = CategoryCardState();
}

class CategoryCardConnector extends ConnOp<CategoryListState, CategoryCardState> {
  @override
  CategoryCardState get(CategoryListState state) => state.categoryCardState;

  @override
  void set(CategoryListState state, CategoryCardState subState) => state.categoryCardState = subState;
}

