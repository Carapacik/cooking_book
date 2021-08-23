// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserCommand _$AuthUserCommandFromJson(Map<String, dynamic> json) {
  return AuthUserCommand(
    name: json['name'] as String?,
    description: json['description'] as String?,
    login: json['login'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$AuthUserCommandToJson(AuthUserCommand instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'login': instance.login,
      'password': instance.password,
    };
