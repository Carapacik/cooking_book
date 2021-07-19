import 'package:json_annotation/json_annotation.dart';
import 'package:recipebook/models/ingredient_model.dart';
import 'package:recipebook/models/step_model.dart';
import 'package:recipebook/models/tag_model.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe {
  Recipe({
    required this.recipeId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.cookingTimeInMinutes,
    required this.portionsCount,
    required this.likesCount,
    required this.favoritesCount,
    required this.userId,
    required this.tags,
    required this.steps,
    required this.ingredients,
  });

  final int recipeId;
  final String name;
  final String description;
  final String imageUrl;
  final int cookingTimeInMinutes;
  final int portionsCount;
  final int likesCount;
  final int favoritesCount;
  final int userId;
  final List<Tag> tags;
  final List<Step> steps;
  final List<Ingredient> ingredients;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
