import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/home_page/state.dart';
import 'package:recipebook/pages/recipes_page/state.dart';

class SearchBarState implements Cloneable<SearchBarState> {
  @override
  SearchBarState clone() {
    return SearchBarState();
  }
}

SearchBarState initState(Map<String, dynamic> args) {
  return SearchBarState();
}

class SearchBarConnector extends ConnOp<RecipesState, SearchBarState> {
  @override
  SearchBarState get(RecipesState state) => state.searchBarState;

  @override
  void set(RecipesState state, SearchBarState subState) => state.searchBarState = subState;
}

class SearchBarConnectorHome extends ConnOp<HomeState, SearchBarState> {
  @override
  SearchBarState get(HomeState state) => state.searchBarState;

  @override
  void set(HomeState state, SearchBarState subState) => state.searchBarState = subState;
}
