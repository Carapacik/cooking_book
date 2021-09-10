import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DailyRecipeComponent extends Component<DailyRecipeState> {
  DailyRecipeComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<DailyRecipeState>(adapter: null, slots: <String, Dependent<DailyRecipeState>>{}),
        );
}
