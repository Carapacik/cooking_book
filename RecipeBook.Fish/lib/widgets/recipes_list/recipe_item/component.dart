import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecipeItemComponent extends Component<RecipeItemState> {
  RecipeItemComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecipeItemState>(adapter: null, slots: <String, Dependent<RecipeItemState>>{}),
        );
}
