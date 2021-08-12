import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/model/recipe_detail.dart';
import 'package:recipebook/model/recipe_item.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/recipe_item_widget.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/delete_dialog.dart';
import 'package:recipebook/widgets/header_widget.dart';
import 'package:recipebook/widgets/outlined_button.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({
    required this.recipeId,
    Key? key,
  }) : super(key: key);

  final String recipeId;

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  late ApiService apiService;
  late RecipeDetail recipeDetail;
  bool isLoading = true;

  @override
  void initState() {
    apiService = ApiService();
    getDetailRecipe();
    super.initState();
  }

  Future getDetailRecipe() async {
    Response response;

    try {
      response = await apiService.getRequest("recipes/${widget.recipeId}");
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          recipeDetail = RecipeDetail.fromJson(jsonDecode(response.data as String) as Map<String, dynamic>);
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
            const HeaderWidget(currentSelectedPage: HeaderButtons.recipes),
            Padding(
              padding: const EdgeInsets.only(top: 127, left: 120, right: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      context.beamBack();
                    },
                    style: TextButton.styleFrom(primary: Palette.orange),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Назад",
                          style: Theme.of(context).textTheme.n18,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isLoading)
                        Text(
                          "Загрузка рецепта...",
                          style: Theme.of(context).textTheme.b42,
                        )
                      else
                        Text(
                          recipeDetail.title,
                          style: Theme.of(context).textTheme.b42,
                        ),
                      Row(
                        children: [
                          ButtonOutlinedWidget(
                            text: "",
                            width: 60,
                            height: 60,
                            icon: Icons.delete_outline,
                            onPressed: () {
                              deleteDialog(context, _deleteRecipe(context, recipeDetail.recipeId));
                            },
                          ),
                          const SizedBox(width: 18),
                          ButtonContainedWidget(
                            text: "Редактировать",
                            width: 278,
                            height: 60,
                            icon: Icons.edit,
                            padding: 18,
                            onPressed: () => context.beamToNamed("/recipes/${widget.recipeId}/edit", popBeamLocationOnPop: true),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  if (isLoading)
                    const Center(child: CircularProgressIndicator(color: Palette.orange))
                  else
                    Column(
                      children: [
                        RecipeItemWidget(
                          isDetail: true,
                          recipeItem: RecipeItem(
                            recipeId: recipeDetail.recipeId,
                            title: recipeDetail.title,
                            description: recipeDetail.description,
                            imageUrl: recipeDetail.imageUrl,
                            username: recipeDetail.username,
                            tags: recipeDetail.tags,
                            favoritesCount: recipeDetail.favoritesCount,
                            likesCount: recipeDetail.likesCount,
                            cookingTimeInMinutes: recipeDetail.cookingTimeInMinutes,
                            portionsCount: recipeDetail.portionsCount,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 396,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ингредиенты",
                                    style: Theme.of(context).textTheme.b20.copyWith(color: Palette.orange),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: recipeDetail.ingredients.length,
                                    itemBuilder: (context, index) {
                                      return ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: recipeDetail.ingredients[index].ingredientNames.length + 1,
                                        itemBuilder: (context, id) {
                                          if (id == 0) {
                                            return Padding(
                                              padding: const EdgeInsets.only(top: 20),
                                              child: Text(
                                                recipeDetail.ingredients[index].title,
                                                style: Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten1),
                                              ),
                                            );
                                          } else {
                                            return Text(
                                              recipeDetail.ingredients[index].ingredientNames[id - 1],
                                              style: Theme.of(context).textTheme.r18,
                                            );
                                          }
                                        },
                                        separatorBuilder: (BuildContext context, int index) {
                                          return const SizedBox(height: 10);
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 790,
                              child: Column(
                                children: [
                                  ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: recipeDetail.steps.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(24),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 16),
                                              blurRadius: 72,
                                              color: Palette.shadowColor,
                                            )
                                          ],
                                        ),
                                        width: 790,
                                        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 73),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Шаг ${index + 1}",
                                              style: Theme.of(context).textTheme.b18.copyWith(color: Palette.mainLighten1),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              recipeDetail.steps[index],
                                              style: Theme.of(context).textTheme.r18,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return const SizedBox(height: 20);
                                    },
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    "Приятного аппетита!",
                                    style: Theme.of(context).textTheme.m24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 105),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  VoidCallback? _deleteRecipe(BuildContext context, int id) {
    return () async {
      try {
        await apiService.deleteRequest("recipes/$id/delete");
        Navigator.of(context).pop();
        context.beamToNamed("/");
      } catch (e) {
        Navigator.of(context).pop();
        context.beamToNamed("/error?e=$e");
      }
    };
  }
}
