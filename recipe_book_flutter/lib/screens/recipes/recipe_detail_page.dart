import 'dart:async';
import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/model/recipe_detail.dart';
import 'package:recipe_book_flutter/model/recipe_item.dart';
import 'package:recipe_book_flutter/notifier/auth_notifier.dart';
import 'package:recipe_book_flutter/resources/images.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/service/api_service.dart';
import 'package:recipe_book_flutter/theme.dart';
import 'package:recipe_book_flutter/widgets/contained_button.dart';
import 'package:recipe_book_flutter/widgets/delete_dialog.dart';
import 'package:recipe_book_flutter/widgets/error_snack_bar.dart';
import 'package:recipe_book_flutter/widgets/header_buttons.dart';
import 'package:recipe_book_flutter/widgets/header_widget.dart';
import 'package:recipe_book_flutter/widgets/outlined_button.dart';
import 'package:recipe_book_flutter/widgets/recipe_item_widget.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({
    required this.recipeId,
    super.key,
  });

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
    unawaited(getDetailRecipe());
    super.initState();
  }

  Future<void> getDetailRecipe() async {
    Response<dynamic> response;

    try {
      response = await apiService.getRequest('recipes/${widget.recipeId}');
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          recipeDetail = RecipeDetail.fromJson(
            jsonDecode(response.data as String) as Map<String, dynamic>,
          );
        });
      } else {}
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
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
              width: MediaQuery.of(context).size.width,
              colorFilter:
                  const ColorFilter.mode(Palette.wave, BlendMode.srcIn),
            ),
            const HeaderWidget(currentSelectedPage: HeaderButtons.recipes),
            Center(
              child: Container(
                alignment: Alignment.topLeft,
                constraints: const BoxConstraints(maxWidth: 1200),
                margin: const EdgeInsets.only(top: 127),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.beamBack();
                      },
                      style:
                          TextButton.styleFrom(foregroundColor: Palette.orange),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            size: 18,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Назад',
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
                            'Загрузка рецепта...',
                            style: Theme.of(context).textTheme.b42,
                          )
                        else
                          Text(
                            recipeDetail.title,
                            style: Theme.of(context).textTheme.b42,
                          ),
                        if (!isLoading)
                          Consumer<AuthNotifier>(
                            builder: (context, auth, child) =>
                                auth.userDetail?.login == recipeDetail.username
                                    ? Row(
                                        children: [
                                          ButtonOutlinedWidget(
                                            text: '',
                                            width: 60,
                                            height: 60,
                                            icon: Icons.delete_outline,
                                            onPressed: () {
                                              deleteDialog(
                                                context,
                                                _deleteRecipe(
                                                  context,
                                                  recipeDetail.recipeId,
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(width: 18),
                                          ButtonContainedWidget(
                                            text: 'Редактировать',
                                            width: 278,
                                            height: 60,
                                            icon: Icons.edit,
                                            padding: 18,
                                            onPressed: () =>
                                                context.beamToNamed(
                                              '/recipes/${widget.recipeId}/edit',
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                          ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    if (isLoading)
                      const Center(
                        child: CircularProgressIndicator(color: Palette.orange),
                      )
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
                              cookingTimeInMinutes:
                                  recipeDetail.cookingTimeInMinutes,
                              portionsCount: recipeDetail.portionsCount,
                              isFavorite: recipeDetail.isFavorite,
                              isLiked: recipeDetail.isLiked,
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
                                      'Ингредиенты',
                                      style: Theme.of(context)
                                          .textTheme
                                          .b20
                                          .copyWith(color: Palette.orange),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          recipeDetail.ingredients.length,
                                      itemBuilder: (context, index) {
                                        return ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: recipeDetail
                                                  .ingredients[index]
                                                  .ingredientNames
                                                  .length +
                                              1,
                                          itemBuilder: (context, id) {
                                            if (id == 0) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 20,
                                                ),
                                                child: Text(
                                                  recipeDetail
                                                      .ingredients[index].title,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .b18
                                                      .copyWith(
                                                        color: Palette
                                                            .mainLighten1,
                                                      ),
                                                ),
                                              );
                                            } else {
                                              return Text(
                                                recipeDetail.ingredients[index]
                                                    .ingredientNames[id - 1],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .r18,
                                              );
                                            }
                                          },
                                          separatorBuilder: (context, index) {
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
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(0, 16),
                                                blurRadius: 72,
                                                color: Palette.shadowColor,
                                              )
                                            ],
                                          ),
                                          width: 790,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 50,
                                            horizontal: 73,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Шаг ${index + 1}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .b18
                                                    .copyWith(
                                                      color:
                                                          Palette.mainLighten1,
                                                    ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                recipeDetail.steps[index],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .r18,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(height: 20);
                                      },
                                    ),
                                    const SizedBox(height: 40),
                                    Text(
                                      'Приятного аппетита!',
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
            ),
          ],
        ),
      ),
    );
  }

  VoidCallback? _deleteRecipe(BuildContext context, int id) {
    final beamer = Beamer.of(context);
    final navigator = Navigator.of(context);
    return () async {
      try {
        await apiService.deleteRequest('recipes/$id/delete');
        navigator.pop();
        beamer.beamToNamed('/');
      } on Exception catch (e) {
        navigator.pop();
        errorSnackBar(context, 'Ошибка удаления: $e');
      }
    };
  }
}
