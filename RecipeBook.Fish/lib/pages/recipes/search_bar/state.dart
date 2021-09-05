import 'package:fish_redux/fish_redux.dart';

class SearchBarState implements Cloneable<SearchBarState> {

  @override
  SearchBarState clone() {
    return SearchBarState();
  }
}

SearchBarState initState(Map<String, dynamic> args) {
  return SearchBarState();
}
