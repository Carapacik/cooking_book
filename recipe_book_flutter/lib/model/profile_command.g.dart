// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileCommand _$ProfileCommandFromJson(Map<String, dynamic> json) {
  return ProfileCommand(
    name: json['name'] as String,
    description: json['description'] as String?,
    login: json['login'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$ProfileCommandToJson(ProfileCommand instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'login': instance.login,
      'password': instance.password,
    };
