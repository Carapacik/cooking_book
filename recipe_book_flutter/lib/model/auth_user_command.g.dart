// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserCommand _$AuthUserCommandFromJson(Map<String, dynamic> json) {
  return AuthUserCommand(
    name: json['name'] as String?,
    login: json['login'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$AuthUserCommandToJson(AuthUserCommand instance) => <String, dynamic>{
      'name': instance.name,
      'login': instance.login,
      'password': instance.password,
    };
