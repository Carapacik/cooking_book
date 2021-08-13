import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/location_builders.dart';
import 'package:recipebook/notifier/auth_notifier.dart';
import 'package:recipebook/notifier/ingredient_notifier.dart';
import 'package:recipebook/notifier/recipe_notifier.dart';
import 'package:recipebook/notifier/step_notifier.dart';
import 'package:recipebook/screens/error/error_page.dart';
import 'package:recipebook/theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthNotifier()),
        ChangeNotifierProvider(create: (_) => RecipeNotifier()),
        ChangeNotifierProvider(create: (_) => IngredientNotifier()),
        ChangeNotifierProvider(create: (_) => StepNotifier()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    notFoundPage: BeamPage(title: "Ошибка", child: const ErrorPage()),
    locationBuilder: recipeLocationBuilder,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeData,
      title: "RecipeBook",
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
