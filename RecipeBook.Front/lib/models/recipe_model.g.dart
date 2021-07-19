// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      recipeId: json['recipeId'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      cookingTimeInMinutes: json['cookingTimeInMinutes'] as int,
      portionsCount: json['portionsCount'] as int,
      likesCount: json['likesCount'] as int,
      favoritesCount: json['favoritesCount'] as int,
      userId: json['userId'] as int,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'recipeId': instance.recipeId,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'cookingTimeInMinutes': instance.cookingTimeInMinutes,
      'portionsCount': instance.portionsCount,
      'likesCount': instance.likesCount,
      'favoritesCount': instance.favoritesCount,
      'userId': instance.userId,
      'tags': instance.tags,
      'steps': instance.steps,
      'ingredients': instance.ingredients,
    };
