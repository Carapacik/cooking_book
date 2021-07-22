import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/controllers/ingredient_notifier.dart';
import 'package:recipebook/controllers/step_notifier.dart';
import 'package:recipebook/recipes/add_recipe_page.dart';
import 'package:recipebook/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StepNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => IngredientNotifier(),
        )
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RecipeBook",
      theme: themeData,
      home: AddRecipePage(title: "Add recipe"),
    );
  }
}
