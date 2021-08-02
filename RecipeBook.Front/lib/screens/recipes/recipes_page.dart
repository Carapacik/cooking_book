import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/models/recipe_item.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/route.dart';
import 'package:recipebook/screens/recipes/components/recipe_item_widget.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/category_card.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/header_widget.dart';
import 'package:recipebook/widgets/outlined_button.dart';
import 'package:recipebook/widgets/search_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class RecipesPage extends StatefulWidget {
  RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late ApiService apiService;

  List<RecipeItem> recipeList = [
    RecipeItem(
      recipeId: 0,
      title: "Клубничная панна-котта",
      description:
          "Десерт, который невероятно легко и быстро готовится. Советую подавать его порционно в красивых бокалах, украсив взбитыми сливками, свежими ягодами и мятой.",
      imageUrl: "https://eda.ru/img/eda/c620x415/s1.eda.ru/StaticContent/Photos/120131083619/170816150250/p_O.jpg",
      username: "@aaass",
      tags: ["десерты", "клубника", "сливки"],
      favoritesCount: 10,
      likesCount: 8,
      cookingTimeInMinutes: 35,
      portionsCount: 5,
    ),
    RecipeItem(
      recipeId: 1,
      title: "sssубничная панна-котта",
      description:
          "Десерт, который невероятно легко и быстро готовится. Советую подавать его порционно в красивых бокалах, украсив взбитыми сливками, свежими ягодами и мятой.",
      imageUrl: "https://eda.ru/img/eda/c620x415/s1.eda.ru/StaticContent/Photos/120131083619/170816150250/p_O.jpg",
      username: "@dass",
      tags: ["десерты", "клубника", "сливки"],
      favoritesCount: 10,
      likesCount: 8,
      cookingTimeInMinutes: 35,
      portionsCount: 5,
    ),
  ];

  Future getInitialRecipes() async {
    Response response;

    try {
      response = await apiService.getInitialWithParam("recipes", 5);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.data as String) as List<dynamic>;
        setState(() {
          for (final item in data) {
            recipeList.add(RecipeItem.fromJson(item as Map<String, dynamic>));
          }
        });
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
    apiService = ApiService();
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
            Padding(
              padding: const EdgeInsets.only(top: 1000),
              child: SvgPicture.asset(
                CookingImages.wave2,
                color: Palette.wave,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            const HeaderWidget(currentSelectedPage: HeaderButtons.recipes),
            Padding(
              padding: const EdgeInsets.only(top: 160, left: 120, right: 120),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Рецепты",
                        style: Theme.of(context).textTheme.b42,
                      ),
                      ButtonContainedWidget(
                        icon: Icons.add,
                        padding: 18,
                        text: "Добавить рецепт",
                        width: 278,
                        height: 60,
                        onPressed: () {
                          context.vxNav.push(Uri.parse(RecipeRoutes.addRecipeRoute));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCardWidget(
                        iconPath: CookingIcons.menu,
                        title: "Простые блюда",
                      ),
                      CategoryCardWidget(
                        iconPath: CookingIcons.cook,
                        title: "Детское",
                      ),
                      CategoryCardWidget(
                        iconPath: CookingIcons.chef,
                        title: "От шеф-поваров",
                      ),
                      CategoryCardWidget(
                        iconPath: CookingIcons.confetti,
                        title: "На праздник",
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Поиск рецепта",
                        style: Theme.of(context).textTheme.b24,
                      ),
                      const SearchWidget(width: 779),
                    ],
                  ),
                  const SizedBox(height: 80),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: recipeList.length,
                    itemBuilder: (context, index) {
                      return RecipeItemWidget(
                        recipeItem: recipeList[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 40);
                    },
                  ),
                  const SizedBox(height: 65),
                  ButtonOutlinedWidget(
                    text: "Загрузить еще",
                    width: 309,
                    height: 60,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 108),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
