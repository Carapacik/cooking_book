// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCommand _$UserCommandFromJson(Map<String, dynamic> json) {
  return UserCommand(
    name: json['name'] as String?,
    description: json['description'] as String?,
    login: json['login'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$UserCommandToJson(UserCommand instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'login': instance.login,
      'password': instance.password,
    };
