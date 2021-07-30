import 'package:recipebook/route.dart';

class HeaderButtons {
  final String name;
  final int index;
  final String route;

  const HeaderButtons._(this.name, this.index, this.route);

  static const home = HeaderButtons._("Главная", 0, RecipeRoutes.homeRoute);
  static const recipes = HeaderButtons._("Рецепты", 1, RecipeRoutes.recipesRoute);
  static const favorites = HeaderButtons._("Избранное", 2, RecipeRoutes.homeRoute);

  static const values = [home, recipes, favorites];

  static HeaderButtons getById(final int id) {
    return values.firstWhere((button) => button.index == id);
  }
}
