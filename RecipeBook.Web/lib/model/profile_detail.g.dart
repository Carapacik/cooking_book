// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetail _$ProfileDetailFromJson(Map<String, dynamic> json) {
  return ProfileDetail(
    recipesCount: json['recipesCount'] as int,
    likesCount: json['likesCount'] as int,
    favoritesCount: json['favoritesCount'] as int,
    userForm: UserForm.fromJson(json['userForm'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileDetailToJson(ProfileDetail instance) =>
    <String, dynamic>{
      'recipesCount': instance.recipesCount,
      'likesCount': instance.likesCount,
      'favoritesCount': instance.favoritesCount,
      'userForm': instance.userForm.toJson(),
    };
