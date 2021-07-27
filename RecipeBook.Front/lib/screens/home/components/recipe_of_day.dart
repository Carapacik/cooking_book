import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/models/recipe_of_day.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/theme.dart';

class RecipeOfDayWidget extends StatefulWidget {
  const RecipeOfDayWidget({Key? key}) : super(key: key);

  @override
  _RecipeOfDayWidgetState createState() => _RecipeOfDayWidgetState();
}

class _RecipeOfDayWidgetState extends State<RecipeOfDayWidget> {
  late ApiService apiService;
  bool isLoading = true;
  late RecipeOfDay recipeOfDay;

  @override
  void initState() {
    apiService = ApiService();
    getRecipeOfDay();
    super.initState();
  }

  Future getRecipeOfDay() async {
    Response response;

    try {
      response = await apiService.getRequest("recipes/recipe-of-day");
      isLoading = false;

      if (response.statusCode == 200) {
        setState(() {
          recipeOfDay = RecipeOfDay.fromJson(jsonDecode(response.data as String) as Map<String, dynamic>);
        });
      } else {
        // затычка
      }
    } on Exception catch (e) {
      // тут как бы нет соединения с сервером
      // возможно перенаправление на отдельную страницу
      isLoading = false;
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        height: 543,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(72), boxShadow: const [
          BoxShadow(
            color: Palette.shadowColor,
            offset: Offset(0, 8),
            blurRadius: 42,
          )
        ]),
        child: const Center(child: CircularProgressIndicator(color: Palette.orange)),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: 543,
              height: 543,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(72),
                  bottomRight: Radius.circular(72),
                ),
              ),
              child: Image.asset(
                recipeOfDay.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 38),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(5),
                ),
              ),
              child: Text(
                recipeOfDay.username,
                style: Theme.of(context).textTheme.r16.copyWith(
                      color: Palette.orange,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 62),
          width: 513,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    CookingIcons.heartEmpty,
                    color: Palette.grey,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    recipeOfDay.likesCount.toString(),
                    style: Theme.of(context).textTheme.r16,
                  ),
                  const SizedBox(width: 27),
                  SvgPicture.asset(
                    CookingIcons.timer,
                    color: Palette.grey,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    "${recipeOfDay.cookingTimeInMinutes} минут",
                    style: Theme.of(context).textTheme.r16,
                  ),
                ],
              ),
              SvgPicture.asset(
                CookingIcons.recipeOfDay,
                height: 95,
              ),
              const SizedBox(height: 32),
              Text(
                recipeOfDay.title,
                style: Theme.of(context).textTheme.b42,
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Text(
                recipeOfDay.description,
                style: Theme.of(context).textTheme.r18,
              ),
            ],
          ),
        )
      ],
    );
  }
}
