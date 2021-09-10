import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/home_page/components/daily_recipe/state.dart';
import 'package:recipebook/pages/state.dart';
import 'package:recipebook/widgets/category_list/state.dart';
import 'package:recipebook/widgets/search_bar/state.dart';

class HomeState implements Cloneable<HomeState> {
  HomeState();

  late CategoryListState categoryListState;
  late SearchBarState searchBarState;
  late DailyRecipeState dailyRecipeState;

  @override
  HomeState clone() {
    return HomeState()
      ..categoryListState = categoryListState
      ..searchBarState = searchBarState
      ..dailyRecipeState = dailyRecipeState;
  }

  factory HomeState.initial() {
    return HomeState()
      ..categoryListState = CategoryListState()
      ..searchBarState = SearchBarState()
      ..dailyRecipeState = DailyRecipeState();
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..categoryListState = CategoryListState()
    ..searchBarState = SearchBarState()
    ..dailyRecipeState = DailyRecipeState();
}

class HomeConnector extends ConnOp<MainState, HomeState> {
  @override
  HomeState get(MainState state) => state.homeState;

  @override
  void set(MainState state, HomeState subState) => state.homeState = subState;
}
