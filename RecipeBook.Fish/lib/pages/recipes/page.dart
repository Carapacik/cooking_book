import 'package:fish_redux/fish_redux.dart';

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
                }),
            middleware: <Middleware<RecipesState>>[
            ],);

}
