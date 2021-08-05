// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeItem _$RecipeItemFromJson(Map<String, dynamic> json) {
  return RecipeItem(
    recipeId: json['recipeId'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    username: json['username'] as String,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    favoritesCount: json['favoritesCount'] as int,
    likesCount: json['likesCount'] as int,
    cookingTimeInMinutes: json['cookingTimeInMinutes'] as int,
    portionsCount: json['portionsCount'] as int,
  );
}

Map<String, dynamic> _$RecipeItemToJson(RecipeItem instance) => <String, dynamic>{
      'recipeId': instance.recipeId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'username': instance.username,
      'tags': instance.tags,
      'favoritesCount': instance.favoritesCount,
      'likesCount': instance.likesCount,
      'cookingTimeInMinutes': instance.cookingTimeInMinutes,
      'portionsCount': instance.portionsCount,
    };
