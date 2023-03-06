import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/screens/error/error_page.dart';
import 'package:recipe_book_flutter/screens/favorite/favorite_page.dart';
import 'package:recipe_book_flutter/screens/home/home_page.dart';
import 'package:recipe_book_flutter/screens/profile/profile_page.dart';
import 'package:recipe_book_flutter/screens/recipes/recipe_detail_page.dart';
import 'package:recipe_book_flutter/screens/recipes/recipe_form_page.dart';
import 'package:recipe_book_flutter/screens/recipes/recipes_page.dart';

final recipeLocationBuilder = BeamerLocationBuilder(
  beamLocations: [
    HomeLocation(),
    RecipesLocation(),
    FavoriteLocation(),
    ProfileLocation(),
    ErrorLocation(),
  ],
);

class ErrorLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathBlueprints => ['/error'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final beamPages = <BeamPage>[];

    if (state.pathBlueprintSegments.contains('error')) {
      final errorMessage = state.queryParameters['e'] ?? '';

      beamPages.add(
        BeamPage(
          key: const ValueKey('error'),
          title: 'Ошибка',
          child: ErrorPage(errorMessage: errorMessage),
        ),
      );
    }

    return beamPages;
  }
}

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

class ProfileLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathBlueprints => ['/profile'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('profile'),
          title: 'Мой профиль',
          child: const ProfilePage(),
        ),
      ];
}

class RecipesLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathBlueprints => [
        '/recipes/add',
        '/recipes/:recipeId',
        '/recipes/:recipeId/edit',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final beamPages = <BeamPage>[];

    if (state.uri.pathSegments.contains('edit')) {
      final recipeId = state.pathParameters['recipeId'];
      const pageTitle = 'Редактировать рецепта';

      beamPages.add(
        BeamPage(
          key: ValueKey('recipes-$recipeId-edit'),
          title: pageTitle,
          child: RecipeFormPage(recipeId: recipeId),
        ),
      );
      return beamPages;
    }

    if (state.uri.pathSegments.contains('add')) {
      const pageTitle = 'Добавить рецепт';

      beamPages.add(
        BeamPage(
          key: const ValueKey('recipes-add'),
          title: pageTitle,
          child: const RecipeFormPage(),
        ),
      );
      return beamPages;
    }

    if (state.pathParameters.containsKey('recipeId')) {
      final recipeId = state.pathParameters['recipeId'];
      const pageTitle = 'Детальный рецепт';

      beamPages.add(
        BeamPage(
          key: ValueKey('recipes-$recipeId'),
          title: pageTitle,
          child: RecipeDetailPage(recipeId: recipeId!),
        ),
      );
      return beamPages;
    }

    if (state.pathBlueprintSegments.contains('recipes')) {
      final searchQuery = state.queryParameters['searchQuery'] ?? '';
      final pageTitle =
          searchQuery != '' ? "Результаты по '$searchQuery'" : 'Рецепты';

      beamPages.add(
        BeamPage(
          key: ValueKey('recipes-$searchQuery'),
          title: pageTitle,
          child: RecipesPage(searchQuery: searchQuery),
        ),
      );
    }

    return beamPages;
  }
}
