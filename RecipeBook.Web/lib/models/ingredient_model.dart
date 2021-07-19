import 'package:json_annotation/json_annotation.dart';
import 'package:recipebook/models/ingredient_item_model.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class Ingredient {
  Ingredient({
    required this.ingredientId,
    required this.title,
    required this.recipeId,
    required this.ingredientItems,
  });

  final int ingredientId;
  final String title;
  final int recipeId;
  final List<IngredientItem> ingredientItems;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
