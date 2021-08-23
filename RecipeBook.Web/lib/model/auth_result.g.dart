// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResult _$AuthResultFromJson(Map<String, dynamic> json) {
  return AuthResult(
    isSuccess: json['isSuccess'] as bool,
    errorMessage: json['errorMessage'] as String?,
  );
}

Map<String, dynamic> _$AuthResultToJson(AuthResult instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorMessage': instance.errorMessage,
    };
