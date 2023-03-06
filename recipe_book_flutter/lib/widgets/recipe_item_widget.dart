import 'package:beamer/beamer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/model/recipe_item.dart';
import 'package:recipe_book_flutter/notifier/auth_notifier.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/screens/recipes/components/recipe_tag_list_widget.dart';
import 'package:recipe_book_flutter/service/api_service.dart';
import 'package:recipe_book_flutter/theme.dart';
import 'package:recipe_book_flutter/widgets/not_auth_dialog.dart';
import 'package:recipe_book_flutter/widgets/outlined_button.dart';
import 'package:recipe_book_flutter/widgets/recipe_image_with_author.dart';

class RecipeItemWidget extends StatefulWidget {
  const RecipeItemWidget({
    required this.recipeItem,
    this.isDetail,
    super.key,
  });

  final RecipeItem recipeItem;
  final bool? isDetail;

  @override
  _RecipeItemWidgetState createState() => _RecipeItemWidgetState();
}

class _RecipeItemWidgetState extends State<RecipeItemWidget> {
  late ApiService apiService;

  @override
  void initState() {
    apiService = ApiService();
    super.initState();
  }

  Future<void> addFavorite() async {
    Response<dynamic> response;

    try {
      widget.recipeItem.favoritesCount++;
      widget.recipeItem.isFavorite = true;
      if (!widget.recipeItem.isLiked) {
        widget.recipeItem.likesCount++;
        widget.recipeItem.isLiked = true;
      }
      response = await apiService.postRequestWithoutData(
        'recipes/${widget.recipeItem.recipeId}/rating/add-to-favorites',
      );
      if (response.statusCode == 200) {
        setState(() {});
      } else {
        setState(() {
          widget.recipeItem.favoritesCount--;
          widget.recipeItem.likesCount--;
        });
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> removeFavorite() async {
    Response<dynamic> response;

    try {
      widget.recipeItem.favoritesCount--;
      widget.recipeItem.isFavorite = false;
      response = await apiService.postRequestWithoutData(
        'recipes/${widget.recipeItem.recipeId}/rating/remove-from-favorites',
      );
      if (response.statusCode == 200) {
        setState(() {});
      } else {
        setState(() {
          widget.recipeItem.favoritesCount++;
        });
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> addLike() async {
    Response<dynamic> response;

    try {
      widget.recipeItem.likesCount++;
      widget.recipeItem.isLiked = true;
      response = await apiService.postRequestWithoutData(
        'recipes/${widget.recipeItem.recipeId}/rating/add-to-likes',
      );
      if (response.statusCode == 200) {
        setState(() {});
      } else {
        setState(() {
          widget.recipeItem.likesCount--;
        });
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> removeLike() async {
    Response<dynamic> response;

    try {
      widget.recipeItem.likesCount--;
      widget.recipeItem.isLiked = false;
      response = await apiService.postRequestWithoutData(
        'recipes/${widget.recipeItem.recipeId}/rating/remove-from-likes',
      );
      if (response.statusCode == 200) {
        setState(() {});
      } else {
        setState(() {
          widget.recipeItem.likesCount++;
        });
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = Provider.of<AuthNotifier>(context);
    return Container(
      height: 430,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(72),
          bottomLeft: Radius.circular(72),
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Palette.shadowColor,
            offset: Offset(0, 16),
            blurRadius: 72,
          )
        ],
      ),
      child: Row(
        children: [
          if (widget.isDetail == null)
            TextButton(
              onPressed: () {
                context.beamToNamed('/recipes/${widget.recipeItem.recipeId}');
              },
              style: TextButton.styleFrom(
                foregroundColor: Palette.orange,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(72),
                    bottomRight: Radius.circular(72),
                  ),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: RecipeImageWithAuthor(
                imageUrl: widget.recipeItem.imageUrl,
                username: widget.recipeItem.username,
                size: 430,
              ),
            )
          else
            RecipeImageWithAuthor(
              imageUrl: widget.recipeItem.imageUrl,
              username: widget.recipeItem.username,
              size: 430,
            ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 36, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 690),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecipeTagsList(tags: widget.recipeItem.tags),
                      Row(
                        children: [
                          ButtonOutlinedWidget(
                            icon: widget.recipeItem.isFavorite
                                ? Icons.star
                                : Icons.star_border,
                            color: widget.recipeItem.isFavorite
                                ? Palette.red
                                : Palette.orange,
                            padding: 12,
                            text: widget.recipeItem.favoritesCount.toString(),
                            width: 107,
                            height: 50,
                            onPressed: () async {
                              if (authNotifier.isAuth) {
                                if (widget.recipeItem.isFavorite) {
                                  await removeFavorite();
                                } else {
                                  await addFavorite();
                                }
                              } else {
                                notAuthDialog(
                                  context,
                                  'Оценивать рецепты могут только авторизированные пользователи.',
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 15),
                          ButtonOutlinedWidget(
                            icon: widget.recipeItem.isLiked
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: widget.recipeItem.isLiked
                                ? Palette.red
                                : Palette.orange,
                            padding: 12,
                            text: widget.recipeItem.likesCount.toString(),
                            width: 107,
                            height: 50,
                            onPressed: () async {
                              if (authNotifier.isAuth) {
                                if (widget.recipeItem.isLiked) {
                                  await removeLike();
                                } else {
                                  await addLike();
                                }
                              } else {
                                notAuthDialog(
                                  context,
                                  'Оценивать рецепты могут только авторизированные пользователи.',
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 34),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recipeItem.title,
                      style: Theme.of(context).textTheme.b24,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 580,
                      height: 95,
                      child: Text(
                        widget.recipeItem.description,
                        style: Theme.of(context).textTheme.r18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 460,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.timer,
                            size: 64,
                          ),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Время приготовления:',
                                style: Theme.of(context).textTheme.r14,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${widget.recipeItem.cookingTimeInMinutes} мин',
                                style: Theme.of(context)
                                    .textTheme
                                    .r16
                                    .copyWith(color: Palette.main),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.people_outline,
                            size: 64,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Рецепт на:',
                                style: Theme.of(context).textTheme.r14,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${widget.recipeItem.portionsCount} персон',
                                style: Theme.of(context)
                                    .textTheme
                                    .r16
                                    .copyWith(color: Palette.main),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
