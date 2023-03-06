// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDetail _$RecipeDetailFromJson(Map<String, dynamic> json) {
  return RecipeDetail(
    recipeId: json['recipeId'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    cookingTimeInMinutes: json['cookingTimeInMinutes'] as int,
    portionsCount: json['portionsCount'] as int,
    likesCount: json['likesCount'] as int,
    favoritesCount: json['favoritesCount'] as int,
    username: json['username'] as String,
    isLiked: json['isLiked'] as bool,
    isFavorite: json['isFavorite'] as bool,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
    ingredients: (json['ingredients'] as List<dynamic>).map((e) => Ingredient.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$RecipeDetailToJson(RecipeDetail instance) => <String, dynamic>{
      'recipeId': instance.recipeId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'cookingTimeInMinutes': instance.cookingTimeInMinutes,
      'portionsCount': instance.portionsCount,
      'likesCount': instance.likesCount,
      'favoritesCount': instance.favoritesCount,
      'isLiked': instance.isLiked,
      'isFavorite': instance.isFavorite,
      'username': instance.username,
      'tags': instance.tags,
      'steps': instance.steps,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
    };
