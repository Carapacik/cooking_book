import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/notifier/recipe_notifier.dart';
import 'package:recipe_book_flutter/resources/images.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/service/api_service.dart';
import 'package:recipe_book_flutter/theme.dart';
import 'package:recipe_book_flutter/widgets/header_buttons.dart';
import 'package:recipe_book_flutter/widgets/header_widget.dart';
import 'package:recipe_book_flutter/widgets/outlined_button.dart';
import 'package:recipe_book_flutter/widgets/recipe_list_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late ApiService _apiService;
  late RecipeNotifier _recipeNotifier;
  bool isEndOfList = true;
  int skipCounter = 0;

  Future<void> getMoreRecipes() async {
    Response<dynamic> response;

    try {
      response = await _apiService.getRequestWithParam(
        endPoint: 'recipes/favorite',
        take: 4,
        skip: skipCounter,
      );
      if (response.statusCode == 200) {
        final listOfRecipes =
            jsonDecode(response.data as String) as List<dynamic>;
        if (listOfRecipes.length == 4) {
          setState(() {
            isEndOfList = false;
          });
        } else {
          setState(() {
            isEndOfList = true;
          });
        }
        _recipeNotifier.addRecipes(listOfRecipes);
        skipCounter += 4;
      } else {}
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getInitialRecipes() async {
    Response<dynamic> response;

    try {
      response = await _apiService.getInitialWithParam('recipes/favorite', 2);
      if (response.statusCode == 200) {
        final listOfRecipes =
            jsonDecode(response.data as String) as List<dynamic>;
        if (listOfRecipes.length == 2) {
          setState(() {
            isEndOfList = false;
          });
        }
        _recipeNotifier
          ..resultString = 'Ваш список пуст'
          ..addClearRecipes(listOfRecipes);
        skipCounter += 2;
      } else {}
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _recipeNotifier = Provider.of<RecipeNotifier>(context, listen: false);
    _apiService = ApiService();
    unawaited(getInitialRecipes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              CookingImages.wave1,
              width: MediaQuery.of(context).size.width,
              colorFilter:
                  const ColorFilter.mode(Palette.wave, BlendMode.srcIn),
            ),
            const HeaderWidget(currentSelectedPage: HeaderButtons.favorite),
            Center(
              child: Container(
                alignment: Alignment.topLeft,
                constraints: const BoxConstraints(maxWidth: 1200),
                margin: const EdgeInsets.only(top: 127),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Избранное',
                      style: Theme.of(context).textTheme.b42,
                    ),
                    const SizedBox(height: 50),
                    const Center(child: RecipeListWidget()),
                    const SizedBox(height: 65),
                    if (!isEndOfList)
                      Center(
                        child: ButtonOutlinedWidget(
                          text: 'Загрузить еще',
                          width: 309,
                          height: 60,
                          onPressed: getMoreRecipes,
                        ),
                      ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
