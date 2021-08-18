import 'package:json_annotation/json_annotation.dart';

part 'recipe_item.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeItem {
  RecipeItem({
    required this.recipeId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.username,
    required this.tags,
    required this.favoritesCount,
    required this.likesCount,
    required this.cookingTimeInMinutes,
    required this.portionsCount,
  });

  final int recipeId;
  final String title;
  final String description;
  final String imageUrl;
  final String username;
  final List<String> tags;
  int favoritesCount;
  int likesCount;
  final int cookingTimeInMinutes;
  final int portionsCount;

  factory RecipeItem.fromJson(Map<String, dynamic> json) => _$RecipeItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeItemToJson(this);
}
