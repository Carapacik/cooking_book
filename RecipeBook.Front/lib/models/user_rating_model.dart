import 'package:json_annotation/json_annotation.dart';

part 'user_rating_model.g.dart';

@JsonSerializable()
class UserRating {
  UserRating({
    required this.userRatingId,
    required this.inFavorite,
    required this.isLiked,
    required this.recipeId,
    required this.userId,
  });

  final int userRatingId;
  final bool inFavorite;
  final bool isLiked;
  final int recipeId;
  final int userId;

  factory UserRating.fromJson(Map<String, dynamic> json) =>
      _$UserRatingFromJson(json);

  Map<String, dynamic> toJson() => _$UserRatingToJson(this);
}
