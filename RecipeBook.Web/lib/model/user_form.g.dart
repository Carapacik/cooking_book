// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserForm _$UserFormFromJson(Map<String, dynamic> json) {
  return UserForm(
    name: json['name'] as String,
    description: json['description'] as String?,
    login: json['login'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserFormToJson(UserForm instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'login': instance.login,
      'password': instance.password,
    };
