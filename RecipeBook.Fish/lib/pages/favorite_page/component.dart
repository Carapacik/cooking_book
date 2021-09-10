import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FavoriteComponent extends Component<FavoriteState> {
  FavoriteComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<FavoriteState>(adapter: null, slots: <String, Dependent<FavoriteState>>{}),
        );
}
