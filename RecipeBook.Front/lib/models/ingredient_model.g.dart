// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      ingredientId: json['ingredientId'] as int,
      title: json['title'] as String,
      recipeId: json['recipeId'] as int,
      ingredientItems: (json['ingredientItems'] as List<dynamic>)
          .map((e) => IngredientItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'ingredientId': instance.ingredientId,
      'title': instance.title,
      'recipeId': instance.recipeId,
      'ingredientItems': instance.ingredientItems,
    };
