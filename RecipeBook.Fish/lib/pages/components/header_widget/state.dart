import 'package:fish_redux/fish_redux.dart';
import 'package:recipebook/pages/components/header_widget/entities/header_item.dart';
import 'package:recipebook/pages/state.dart';

class HeaderWidgetState implements Cloneable<HeaderWidgetState> {
  HeaderWidgetState();

  late List<HeaderItem> items;
  late HeaderItem selectedItem;

  @override
  HeaderWidgetState clone() {
    return HeaderWidgetState()
      ..items = items
      ..selectedItem = selectedItem;
  }

  factory HeaderWidgetState.initial() {
    return HeaderWidgetState()
      ..selectedItem = HeaderItem.home
      ..items = [
        HeaderItem.home,
        HeaderItem.recipes,
        HeaderItem.recipeDetail,
        HeaderItem.recipeForm,
        HeaderItem.favorite,
        HeaderItem.profile,
      ];
  }
}

HeaderWidgetState initState(Map<String, dynamic> args) {
  return HeaderWidgetState();
}

class HeaderWidgetConnector extends ConnOp<MainState, HeaderWidgetState> {
  @override
  HeaderWidgetState get(MainState state) => state.headerWidgetState;

  @override
  void set(MainState state, HeaderWidgetState subState) => state.headerWidgetState = subState;
}
