import 'package:json_annotation/json_annotation.dart';

part 'recipe_of_day.g.dart';

@JsonSerializable()
class RecipeOfDay {
  const RecipeOfDay({
    required this.recipeId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.likesCount,
    required this.cookingTimeInMinutes,
    required this.username,
  });

  factory RecipeOfDay.fromJson(Map<String, dynamic> json) =>
      _$RecipeOfDayFromJson(json);

  final int recipeId;
  final String title;
  final String description;
  final String imageUrl;
  final int likesCount;
  final int cookingTimeInMinutes;
  final String username;

  Map<String, dynamic> toJson() => _$RecipeOfDayToJson(this);
}
