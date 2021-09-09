import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecipesListComponent extends Component<RecipesListState> {
  RecipesListComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecipesListState>(adapter: null, slots: <String, Dependent<RecipesListState>>{}),
        );
}
