import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/state.dart';
import 'package:recipebook/widgets/category_list/state.dart';
import 'package:recipebook/widgets/recipes_list/state.dart';
import 'package:recipebook/widgets/search_bar/state.dart';

class RecipesState implements Cloneable<RecipesState> {
  RecipesState();

  late CategoryListState categoryListState;
  late SearchBarState searchBarState;
  late RecipesListState recipesListState;

  @override
  RecipesState clone() {
    return RecipesState()
      ..categoryListState = categoryListState
      ..searchBarState = searchBarState
      ..recipesListState = recipesListState;
  }

  factory RecipesState.initial() {
    return RecipesState()
      ..categoryListState = CategoryListState()
      ..searchBarState = SearchBarState()
      ..recipesListState = RecipesListState();
  }
}

RecipesState initState(Map<String, dynamic> args) {
  return RecipesState()
    ..categoryListState = CategoryListState()
    ..searchBarState = SearchBarState()
    ..recipesListState = RecipesListState();
}

class RecipesConnector extends ConnOp<MainState, RecipesState> {
  @override
  RecipesState get(MainState state) => state.recipesState;

  @override
  void set(MainState state, RecipesState subState) => state.recipesState = subState;
}
