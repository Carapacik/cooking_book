import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/screens/favorite/favorite_page.dart';
import 'package:recipebook/screens/home/home_page.dart';
import 'package:recipebook/screens/recipes/add_recipe_page.dart';
import 'package:recipebook/screens/recipes/recipe_detail_page.dart';
import 'package:recipebook/screens/recipes/recipes_page.dart';

final recipeLocationBuilder = BeamerLocationBuilder(
  beamLocations: [
    HomeLocation(),
    RecipeLocation(),
    FavoriteLocation(),
  ],
);

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathBlueprints => ['/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('home'),
          title: 'Главная',
          child: HomePage(),
        ),
      ];
}

class FavoriteLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathBlueprints => ['/favorite'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('favorite'),
          title: 'Избранное',
          child: const FavoritePage(),
        ),
      ];
}

class RecipeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathBlueprints => [
        '/recipes/add',
        '/recipes/:recipeId',
        '/recipes/:recipeId/edit',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final beamPages = [...HomeLocation().buildPages(context, state)];

    if (state.pathBlueprintSegments.contains('recipes')) {
      final searchQuery = state.queryParameters['searchQuery'] ?? '';
      final pageTitle = searchQuery != '' ? "Результаты по '$searchQuery'" : 'Рецепты';

      beamPages.add(
        BeamPage(
          key: ValueKey('recipe-$searchQuery'),
          title: pageTitle,
          child: RecipesPage(searchQuery: searchQuery),
        ),
      );
    }

    if (state.pathParameters.containsKey('recipeId')) {
      final recipeId = state.pathParameters['recipeId'];
      const pageTitle = 'Детальный рецепт';

      beamPages.add(
        BeamPage(
          key: ValueKey('recipe-$recipeId'),
          title: pageTitle,
          child: RecipeDetailPage(recipeId: recipeId!),
        ),
      );
    }

    if (state.uri.pathSegments.contains('add')) {
      const pageTitle = 'Добавить рецепт';

      beamPages.add(
        BeamPage(
          key: const ValueKey('recipe-add'),
          title: pageTitle,
          child: AddRecipePage(),
        ),
      );
    }

    if (state.uri.pathSegments.contains('edit')) {
      final recipeId = state.pathParameters['recipeId'];
      const pageTitle = 'Редактирование рецепта';

      beamPages.add(
        BeamPage(
          key: ValueKey('recipe-$recipeId-edit'),
          title: pageTitle,
          child: AddRecipePage(), // редактирование рецепта
        ),
      );
    }

    return beamPages;
  }
}
