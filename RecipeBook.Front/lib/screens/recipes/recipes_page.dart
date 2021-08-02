import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/controllers/recipe_notifier.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/route.dart';
import 'package:recipebook/screens/recipes/components/recipe_list_widget.dart';
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
  int skipCounter = 4;
  late RecipeNotifier recipeNotifier;

  Future getMoreRecipes() async {
    Response response;

    try {
      response = await apiService.getRequestWithParam(endPoint: "recipes", take: 4, skip: skipCounter);
      if (response.statusCode == 200) {
        skipCounter += 4;

        recipeNotifier.addRecipes(jsonDecode(response.data as String) as List<dynamic>);
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
      response = await apiService.getInitialWithParam("recipes", 4);
      if (response.statusCode == 200) {
        recipeNotifier.addInitialRecipes(jsonDecode(response.data as String) as List<dynamic>);
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
  void dispose() {
    recipeNotifier.clearList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    recipeNotifier = Provider.of<RecipeNotifier>(context);

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
                  const RecipeListWidget(),
                  // ListView.separated(
                  //   shrinkWrap: true,
                  //   itemCount: recipeList.length,
                  //   itemBuilder: (context, index) {
                  //     return RecipeItemWidget(
                  //       recipeItem: recipeList[index],
                  //     );
                  //   },
                  //   separatorBuilder: (BuildContext context, int index) {
                  //     return const SizedBox(height: 40);
                  //   },
                  // ),
                  const SizedBox(height: 65),
                  ButtonOutlinedWidget(
                    text: "Загрузить еще",
                    width: 309,
                    height: 60,
                    onPressed: () {
                      getMoreRecipes();
                    },
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
