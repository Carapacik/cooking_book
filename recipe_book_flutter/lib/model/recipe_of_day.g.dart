// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_of_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeOfDay _$RecipeOfDayFromJson(Map<String, dynamic> json) => RecipeOfDay(
      recipeId: json['recipeId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      likesCount: json['likesCount'] as int,
      cookingTimeInMinutes: json['cookingTimeInMinutes'] as int,
      username: json['username'] as String,
    );

Map<String, dynamic> _$RecipeOfDayToJson(RecipeOfDay instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'likesCount': instance.likesCount,
      'cookingTimeInMinutes': instance.cookingTimeInMinutes,
      'username': instance.username,
    };
