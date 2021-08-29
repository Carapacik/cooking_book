import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/notifier/recipe_notifier.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/header_buttons.dart';
import 'package:recipebook/widgets/header_widget.dart';
import 'package:recipebook/widgets/recipe_list_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late ApiService _apiService;
  late RecipeNotifier _recipeNotifier;
  bool isEndOfList = true;
  int skipCounter = 0;

  Future getMoreRecipes() async {
    Response response;

    try {
      response = await _apiService.getRequestWithParam(endPoint: "recipes/favorite", take: 4, skip: skipCounter);
      if (response.statusCode == 200) {
        final listOfRecipes = jsonDecode(response.data as String) as List<dynamic>;
        if (listOfRecipes.length == 4) {
          setState(() {
            isEndOfList = false;
          });
        }
        _recipeNotifier.addRecipes(listOfRecipes);
        skipCounter += 4;
      } else {
        // затычка, код не 200
      }
    } on Exception catch (e) {
      // возможно перенаправление на отдельную страницу
      print(e);
    }
  }

  Future getInitialRecipes() async {
    Response response;

    try {
      response = await _apiService.getInitialWithParam("recipes/favorite", 2);
      if (response.statusCode == 200) {
        _recipeNotifier.resultString = "Ваш список пуст";
        _recipeNotifier.addClearRecipes(jsonDecode(response.data as String) as List<dynamic>);
        skipCounter += 2;
      } else {
        // затычка, код не 200
      }
    } on Exception catch (e) {
      // возможно перенаправление на отдельную страницу
      print(e);
    }
  }

  @override
  void initState() {
    _recipeNotifier = Provider.of<RecipeNotifier>(context, listen: false);
    _apiService = ApiService();
    getInitialRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              CookingImages.wave1,
              color: Palette.wave,
              width: MediaQuery.of(context).size.width,
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
                      "Избранное",
                      style: Theme.of(context).textTheme.b42,
                    ),
                    const SizedBox(height: 50),
                    const Center(child: RecipeListWidget()),
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
