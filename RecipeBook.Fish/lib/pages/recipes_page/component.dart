import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/widgets/category_list/component.dart';
import 'package:recipebook/widgets/category_list/state.dart';
import 'package:recipebook/widgets/recipes_list/component.dart';
import 'package:recipebook/widgets/recipes_list/state.dart';
import 'package:recipebook/widgets/search_bar/component.dart';
import 'package:recipebook/widgets/search_bar/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecipesComponent extends Component<RecipesState> {
  RecipesComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecipesState>(adapter: null, slots: <String, Dependent<RecipesState>>{
            'category_list': CategoryListConnector() + CategoryListComponent(),
            'search_bar': SearchBarConnector() + SearchBarComponent(),
            'recipes_list': RecipesListConnector() + RecipesListComponent(),
          }),
        );
}
