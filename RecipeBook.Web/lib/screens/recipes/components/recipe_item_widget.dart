import 'package:beamer/beamer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/model/recipe_item.dart';
import 'package:recipebook/notifier/auth_notifier.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/screens/recipes/components/recipe_tag_list_widget.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/not_auth_dialog.dart';
import 'package:recipebook/widgets/outlined_button.dart';
import 'package:recipebook/widgets/recipe_image_with_author.dart';

class RecipeItemWidget extends StatefulWidget {
  const RecipeItemWidget({
    this.isDetail,
    required this.recipeItem,
    Key? key,
  }) : super(key: key);

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

  Future incrementFavorite() async {
    Response response;

    try {
      widget.recipeItem.favoritesCount++;
      response = await apiService.getRequest("rating/${widget.recipeItem.recipeId}/favorite");
      if (response.statusCode == 200) {
        setState(() {});
      } else {
        setState(() {
          widget.recipeItem.favoritesCount--;
        });
      }
    } on Exception catch (e) {
      // возможно перенаправление на отдельную страницу
      print(e);
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
                context.beamToNamed("/recipes/${widget.recipeItem.recipeId}");
              },
              style: TextButton.styleFrom(
                primary: Palette.orange,
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
                  constraints: const BoxConstraints(
                    maxWidth: 770,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecipeTagsList(tags: widget.recipeItem.tags),
                      Row(
                        children: [
                          ButtonOutlinedWidget(
                            icon: Icons.star,
                            padding: 12,
                            text: widget.recipeItem.favoritesCount.toString(),
                            width: 107,
                            height: 50,
                            onPressed: () {
                              if (authNotifier.isAuth) {
                                incrementFavorite();
                              } else {
                                notAuthDialog(
                                  context,
                                  "Оценивать рецепты могут только авторизированные пользователи.",
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 15),
                          ButtonOutlinedWidget(
                            icon: Icons.favorite_outline,
                            padding: 12,
                            text: widget.recipeItem.likesCount.toString(),
                            width: 107,
                            height: 50,
                            onPressed: () {
                              if (authNotifier.isAuth) {
                                //updateLikes();
                              } else {
                                notAuthDialog(
                                  context,
                                  "Оценивать рецепты могут только авторизированные пользователи.",
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
                                "Время приготовления:",
                                style: Theme.of(context).textTheme.r14,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${widget.recipeItem.cookingTimeInMinutes} мин",
                                style: Theme.of(context).textTheme.r16.copyWith(color: Palette.main),
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
                                "Рецепт на:",
                                style: Theme.of(context).textTheme.r14,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${widget.recipeItem.portionsCount} персон",
                                style: Theme.of(context).textTheme.r16.copyWith(color: Palette.main),
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
