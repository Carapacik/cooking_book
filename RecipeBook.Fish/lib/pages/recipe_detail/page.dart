import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecipeDetailPage extends Page<RecipeDetailState, Map<String, dynamic>> {
  RecipeDetailPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecipeDetailState>(adapter: null, slots: <String, Dependent<RecipeDetailState>>{}),
          middleware: <Middleware<RecipeDetailState>>[],
        );
}
