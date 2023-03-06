import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_book_flutter/model/ingredient.dart';

part 'recipe_command.g.dart';

@JsonSerializable()
class RecipeCommand {
  const RecipeCommand({
    required this.title,
    required this.description,
    required this.cookingTimeInMinutes,
    required this.portionsCount,
    required this.tags,
    required this.steps,
    required this.ingredients,
    this.recipeId,
  });

  factory RecipeCommand.fromJson(Map<String, dynamic> json) =>
      _$RecipeCommandFromJson(json);

  final int? recipeId;
  final String title;
  final String description;
  final int cookingTimeInMinutes;
  final int portionsCount;
  final List<String> tags;
  final List<String> steps;
  final List<Ingredient> ingredients;

  Map<String, dynamic> toJson() => _$RecipeCommandToJson(this);
}
