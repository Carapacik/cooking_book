import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/routes.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AbstractRoutes routes = Routes.routes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: routes.buildPage(RoutePath.recipesPage, null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}
