import 'package:flutter/material.dart';
import 'package:recipebook/recipes/add_recipe_page.dart';
import 'package:recipebook/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RecipeBook",
      theme: themeData(context),
      home: AddRecipePage(title: "Add recipe"),
    );
  }
}
