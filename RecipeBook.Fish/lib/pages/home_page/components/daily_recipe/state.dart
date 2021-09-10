import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/home_page/state.dart';

class DailyRecipeState implements Cloneable<DailyRecipeState> {
  @override
  DailyRecipeState clone() {
    return DailyRecipeState();
  }
}

DailyRecipeState initState(Map<String, dynamic> args) {
  return DailyRecipeState();
}

class DailyRecipeConnector extends ConnOp<HomeState, DailyRecipeState> {
  @override
  DailyRecipeState get(HomeState state) => state.dailyRecipeState;

  @override
  void set(HomeState state, DailyRecipeState subState) => state.dailyRecipeState = subState;
}
