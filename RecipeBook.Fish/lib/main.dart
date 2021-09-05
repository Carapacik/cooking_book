import 'package:flutter/material.dart';
import 'package:recipebook/pages/recipes/page.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipesPage().buildPage(null),
    );
  }
}
