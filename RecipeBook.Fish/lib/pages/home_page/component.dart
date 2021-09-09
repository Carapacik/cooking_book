import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/widgets/category_list/component.dart';
import 'package:recipebook/widgets/category_list/state.dart';
import 'package:recipebook/widgets/search_bar/component.dart';
import 'package:recipebook/widgets/search_bar/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeComponent extends Component<HomeState> {
  HomeComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
            adapter: null,
            slots: <String, Dependent<HomeState>>{
              'category_list': CategoryListConnectorHome() + CategoryListComponent(),
              'search_bar': SearchBarConnectorHome() + SearchBarComponent(),
            },
          ),
        );
}
