import 'package:json_annotation/json_annotation.dart';

import 'ingredient.dart';

part 'recipe_command.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeCommand {
  RecipeCommand({
    this.recipeId,
    required this.title,
    required this.description,
    required this.cookingTimeInMinutes,
    required this.portionsCount,
    required this.tags,
    required this.steps,
    required this.ingredients,
  });

  final int? recipeId;
  final String title;
  final String description;
  final int cookingTimeInMinutes;
  final int portionsCount;
  final List<String> tags;
  final List<String> steps;
  final List<Ingredient> ingredients;

  factory RecipeCommand.fromJson(Map<String, dynamic> json) => _$RecipeCommandFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeCommandToJson(this);
}
