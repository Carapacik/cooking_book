import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/location_builders.dart';
import 'package:recipe_book_flutter/notifier/auth_notifier.dart';
import 'package:recipe_book_flutter/notifier/ingredient_notifier.dart';
import 'package:recipe_book_flutter/notifier/recipe_notifier.dart';
import 'package:recipe_book_flutter/notifier/step_notifier.dart';
import 'package:recipe_book_flutter/screens/error/error_page.dart';
import 'package:recipe_book_flutter/theme.dart';
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
  App({super.key});

  final _routerDelegate = BeamerDelegate(
    notFoundPage: BeamPage(
      title: '404',
      child: const ErrorPage(),
    ),
    locationBuilder: recipeLocationBuilder.call,
    guards: [
      BeamGuard(
        check: (context, location) => context.read<AuthNotifier>().isAuth,
        beamToNamed: "/error?e=You don't have access",
        pathBlueprints: ['/recipes/add', '/favorite', '/profile'],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeData,
      title: 'RecipeBook',
      debugShowCheckedModeBanner: false,
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
