import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  Ingredient({
    required this.title,
    required this.ingredientNames,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  String title;
  List<String> ingredientNames;

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
