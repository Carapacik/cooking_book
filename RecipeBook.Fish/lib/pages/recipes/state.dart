import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/widgets/category_list/state.dart';
import 'package:recipebook/widgets/header_widget/state.dart';
import 'package:recipebook/widgets/search_bar/state.dart';

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
