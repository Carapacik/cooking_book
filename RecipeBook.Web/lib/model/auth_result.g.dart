// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResult _$AuthResultFromJson(Map<String, dynamic> json) {
  return AuthResult(
    result: json['result'] as bool,
    error: json['error'] as String?,
  );
}

Map<String, dynamic> _$AuthResultToJson(AuthResult instance) => <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };
