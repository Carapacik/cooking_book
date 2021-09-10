import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecipeFormComponent extends Component<RecipeFormState> {
  RecipeFormComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecipeFormState>(adapter: null, slots: <String, Dependent<RecipeFormState>>{}),
        );
}
