import 'package:json_annotation/json_annotation.dart';

import 'ingredient.dart';

part 'add_recipe.g.dart';

@JsonSerializable()
class AddRecipe {
  AddRecipe({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.cookingTimeInMinutes,
    required this.portionsCount,
    required this.tags,
    required this.steps,
    required this.ingredients,
  });

  final String title;
  final String description;
  final String imageUrl;
  final int cookingTimeInMinutes;
  final int portionsCount;
  final List<String> tags;
  final List<String> steps;
  final List<Ingredient> ingredients;

  factory AddRecipe.fromJson(Map<String, dynamic> json) =>
      _$AddRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$AddRecipeToJson(this);
}
