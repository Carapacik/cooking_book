import 'package:json_annotation/json_annotation.dart';

part 'ingredient_item_model.g.dart';

@JsonSerializable()
class IngredientItem {
  IngredientItem({
    required this.ingredientItemId,
    required this.name,
    required this.ingredientId,
  });

  final int ingredientItemId;
  final String name;
  final int ingredientId;

  factory IngredientItem.fromJson(Map<String, dynamic> json) =>
      _$IngredientItemFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientItemToJson(this);
}
