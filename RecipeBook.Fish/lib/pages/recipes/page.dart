import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/recipes/state.dart';
import 'package:recipebook/widgets/category_list/component.dart';
import 'package:recipebook/widgets/category_list/state.dart' as categoryListState;
import 'package:recipebook/widgets/header_widget/component.dart';
import 'package:recipebook/widgets/header_widget/state.dart' as headerState;
import 'package:recipebook/widgets/search_bar/component.dart';
import 'package:recipebook/widgets/search_bar/state.dart' as searchBarState;


import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecipesPage extends Page<RecipesState, Map<String, dynamic>> {
  RecipesPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecipesState>(adapter: null, slots: <String, Dependent<RecipesState>>{
            'header_widget': headerState.HeaderWidgetConnector() + HeaderWidgetComponent(),
            'category_list': categoryListState.CategoryListConnector() + CategoryListComponent(),
            'search_bar': searchBarState.SearchBarConnector() + SearchBarComponent(),
          }),
          middleware: <Middleware<RecipesState>>[],
        );
}
