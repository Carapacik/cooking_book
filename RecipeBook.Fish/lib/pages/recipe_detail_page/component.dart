import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecipeDetailComponent extends Component<RecipeDetailState> {
  RecipeDetailComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecipeDetailState>(adapter: null, slots: <String, Dependent<RecipeDetailState>>{}),
        );
}
