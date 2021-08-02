import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/controllers/ingredient_notifier.dart';
import 'package:recipebook/controllers/recipe_notifier.dart';
import 'package:recipebook/controllers/step_notifier.dart';
import 'package:recipebook/route.dart';
import 'package:recipebook/screens/error/error_page.dart';
import 'package:recipebook/screens/home/home_page.dart';
import 'package:recipebook/screens/recipes/add_recipe_page.dart';
import 'package:recipebook/screens/recipes/recipe_detail_page.dart';
import 'package:recipebook/screens/recipes/recipes_page.dart';
import 'package:recipebook/theme.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StepNotifier()),
        ChangeNotifierProvider(create: (_) => IngredientNotifier()),
        ChangeNotifierProvider(create: (_) => RecipeNotifier())
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeData,
      title: "RecipeBook",
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        '/': (_, __) => const MaterialPage(child: HomePage()),
        RecipeRoutes.homeRoute: (_, __) => const MaterialPage(child: HomePage()),
        RecipeRoutes.addRecipeRoute: (_, __) => MaterialPage(child: AddRecipePage()),
        RecipeRoutes.recipesRoute: (_, __) => MaterialPage(child: RecipesPage()),
        RecipeRoutes.recipeDetailRoute: (_, __) => const MaterialPage(child: RecipeDetailPage()),
        RecipeRoutes.errorRoute: (_, __) => const MaterialPage(child: ConnectionLostPage()),
      }),
    );
  }
}
