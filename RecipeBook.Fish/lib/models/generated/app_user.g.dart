// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return AppUser(
    name: json['name'] as String,
    login: json['login'] as String,
  );
}

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'name': instance.name,
      'login': instance.login,
    };
