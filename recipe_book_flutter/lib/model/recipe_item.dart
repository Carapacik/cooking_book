import 'package:json_annotation/json_annotation.dart';

part 'recipe_item.g.dart';

@JsonSerializable()
class RecipeItem {
  RecipeItem({
    required this.recipeId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.cookingTimeInMinutes,
    required this.portionsCount,
    required this.favoritesCount,
    required this.likesCount,
    required this.username,
    required this.isLiked,
    required this.isFavorite,
    required this.tags,
  });

  factory RecipeItem.fromJson(Map<String, dynamic> json) =>
      _$RecipeItemFromJson(json);

  final int recipeId;
  final String title;
  final String description;
  final String imageUrl;
  final int cookingTimeInMinutes;
  final int portionsCount;
  final String username;
  int favoritesCount;
  int likesCount;
  bool isLiked;
  bool isFavorite;
  final List<String> tags;

  Map<String, dynamic> toJson() => _$RecipeItemToJson(this);
}
