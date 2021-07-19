// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRating _$UserRatingFromJson(Map<String, dynamic> json) => UserRating(
      userRatingId: json['userRatingId'] as int,
      inFavorite: json['inFavorite'] as bool,
      isLiked: json['isLiked'] as bool,
      recipeId: json['recipeId'] as int,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$UserRatingToJson(UserRating instance) =>
    <String, dynamic>{
      'userRatingId': instance.userRatingId,
      'inFavorite': instance.inFavorite,
      'isLiked': instance.isLiked,
      'recipeId': instance.recipeId,
      'userId': instance.userId,
    };
