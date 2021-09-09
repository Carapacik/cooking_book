import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/home_page/state.dart';
import 'package:recipebook/pages/recipes_page/state.dart';

class CategoryListState implements Cloneable<CategoryListState> {
  @override
  CategoryListState clone() {
    return CategoryListState();
  }
}

CategoryListState initState(Map<String, dynamic> args) {
  return CategoryListState();
}

class CategoryListConnector extends ConnOp<RecipesState, CategoryListState> {
  @override
  CategoryListState get(RecipesState state) => state.categoryListState;

  @override
  void set(RecipesState state, CategoryListState subState) => state.categoryListState = subState;
}

class CategoryListConnectorHome extends ConnOp<HomeState, CategoryListState> {
  @override
  CategoryListState get(HomeState state) => state.categoryListState;

  @override
  void set(HomeState state, CategoryListState subState) => state.categoryListState = subState;
}
