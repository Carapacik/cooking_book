// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      recipesCount: json['recipesCount'] as int,
      likesCount: json['likesCount'] as int,
      favoritesCount: json['favoritesCount'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      login: json['login'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'recipesCount': instance.recipesCount,
      'likesCount': instance.likesCount,
      'favoritesCount': instance.favoritesCount,
      'name': instance.name,
      'description': instance.description,
      'login': instance.login,
    };
