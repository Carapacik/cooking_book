import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/recipes/category_list/category_card/component.dart';

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
            slots: <String, Dependent<CategoryListState>>{
              'category_card': CategoryCardComponent(), // тут не получается закинуть
            },
          ),
        );
}
