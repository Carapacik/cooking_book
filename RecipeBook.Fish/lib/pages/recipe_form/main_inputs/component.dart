import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MainInputsComponent extends Component<MainInputsState> {
  MainInputsComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MainInputsState>(adapter: null, slots: <String, Dependent<MainInputsState>>{}),
        );
}
