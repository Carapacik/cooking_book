// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeCommand _$RecipeCommandFromJson(Map<String, dynamic> json) =>
    RecipeCommand(
      recipeId: json['recipeId'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      cookingTimeInMinutes: json['cookingTimeInMinutes'] as int,
      portionsCount: json['portionsCount'] as int,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeCommandToJson(RecipeCommand instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'title': instance.title,
      'description': instance.description,
      'cookingTimeInMinutes': instance.cookingTimeInMinutes,
      'portionsCount': instance.portionsCount,
      'tags': instance.tags,
      'steps': instance.steps,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
    };
