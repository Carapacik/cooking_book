import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HeaderWidgetComponent extends Component<HeaderWidgetState> {
  HeaderWidgetComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HeaderWidgetState>(
                adapter: null,
                slots: <String, Dependent<HeaderWidgetState>>{
                }),);

}
