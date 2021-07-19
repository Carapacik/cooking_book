// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientItem _$IngredientItemFromJson(Map<String, dynamic> json) {
  return IngredientItem(
    ingredientItemId: json['ingredientItemId'] as int,
    name: json['name'] as String,
    ingredientId: json['ingredientId'] as int,
  );
}

Map<String, dynamic> _$IngredientItemToJson(IngredientItem instance) =>
    <String, dynamic>{
      'ingredientItemId': instance.ingredientItemId,
      'name': instance.name,
      'ingredientId': instance.ingredientId,
    };
