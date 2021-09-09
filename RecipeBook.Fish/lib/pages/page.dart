import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/components/header_widget/component.dart';
import 'package:recipebook/pages/components/header_widget/state.dart' as headerState;
import 'package:recipebook/pages/home_page/component.dart';
import 'package:recipebook/pages/home_page/state.dart' as homeState;
import 'package:recipebook/pages/recipes_page/component.dart';
import 'package:recipebook/pages/recipes_page/state.dart' as recipesState;

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MainPage extends Page<MainState, Map<String, dynamic>> {
  MainPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MainState>(adapter: null, slots: <String, Dependent<MainState>>{
            'header_widget': headerState.HeaderWidgetConnector() + HeaderWidgetComponent(),
            'home_page': homeState.HomeConnector() + HomeComponent(),
            'recipes_page': recipesState.RecipesConnector() + RecipesComponent(),
          }),
          middleware: <Middleware<MainState>>[],
        );
}
