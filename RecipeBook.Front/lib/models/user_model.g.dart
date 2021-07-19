// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      login: json['login'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'login': instance.login,
      'password': instance.password,
    };
