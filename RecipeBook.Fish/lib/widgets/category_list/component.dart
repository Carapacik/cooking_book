import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CategoryListComponent extends Component<CategoryListState> {
  CategoryListComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CategoryListState>(
            adapter: null,
            slots: <String, Dependent<CategoryListState>>{},
          ),
        );
}
