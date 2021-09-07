import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/recipes/category_list/component.dart';
import 'package:recipebook/pages/recipes/header_widget/component.dart';
import 'package:recipebook/pages/recipes/search_bar/component.dart';

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
            dependencies: Dependencies<RecipesState>(
                adapter: null,
                slots: <String, Dependent<RecipesState>>{
                  'header_widget': HeaderWidgetConnector() + HeaderWidgetComponent(),
                  'category_list': CategoryListConnector() + CategoryListComponent(),
                  'search_bar': SearchBarConnector() + SearchBarComponent(),
                }),
            middleware: <Middleware<RecipesState>>[
            ],);

}
