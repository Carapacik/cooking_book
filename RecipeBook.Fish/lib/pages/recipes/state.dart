import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/recipes/category_list/state.dart';
import 'package:recipebook/pages/recipes/header_widget/state.dart';
import 'package:recipebook/pages/recipes/search_bar/state.dart';

class RecipesState implements Cloneable<RecipesState> {
  late CategoryListState categoryListState;
  late HeaderWidgetState headerWidgetState;
  late SearchBarState searchBarState;

  @override
  RecipesState clone() {
    return RecipesState();
  }
}

RecipesState initState(Map<String, dynamic> args) {
  return RecipesState()
    ..headerWidgetState = HeaderWidgetState()
    ..categoryListState = CategoryListState()
    ..searchBarState = SearchBarState();
}

class HeaderWidgetConnector extends ConnOp<RecipesState, HeaderWidgetState> {
  @override
  HeaderWidgetState get(RecipesState state) => state.headerWidgetState;

  @override
  void set(RecipesState state, HeaderWidgetState subState) => state.headerWidgetState = subState;
}

class CategoryListConnector extends ConnOp<RecipesState, CategoryListState> {
  @override
  CategoryListState get(RecipesState state) => state.categoryListState;

  @override
  void set(RecipesState state, CategoryListState subState) => state.categoryListState = subState;
}

class SearchBarConnector extends ConnOp<RecipesState, SearchBarState> {
  @override
  SearchBarState get(RecipesState state) => state.searchBarState;

  @override
  void set(RecipesState state, SearchBarState subState) => state.searchBarState = subState;
}
