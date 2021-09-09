import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class StepInputsComponent extends Component<StepInputsState> {
  StepInputsComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<StepInputsState>(adapter: null, slots: <String, Dependent<StepInputsState>>{}),
        );
}
