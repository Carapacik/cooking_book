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
    cookingTimeInMinutes: json['cookingTimeInMinutes'] as int,
    portionsCount: json['portionsCount'] as int,
    favoritesCount: json['favoritesCount'] as int,
    likesCount: json['likesCount'] as int,
    username: json['username'] as String,
    isLiked: json['isLiked'] as bool,
    isFavorite: json['isFavorite'] as bool,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$RecipeItemToJson(RecipeItem instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'cookingTimeInMinutes': instance.cookingTimeInMinutes,
      'portionsCount': instance.portionsCount,
      'username': instance.username,
      'favoritesCount': instance.favoritesCount,
      'likesCount': instance.likesCount,
      'isLiked': instance.isLiked,
      'isFavorite': instance.isFavorite,
      'tags': instance.tags,
    };
