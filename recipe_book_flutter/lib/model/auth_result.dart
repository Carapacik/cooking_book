import 'package:json_annotation/json_annotation.dart';

part 'auth_result.g.dart';

@JsonSerializable()
class AuthResult {
  const AuthResult({
    required this.isSuccess,
    required this.errorMessage,
  });

  factory AuthResult.fromJson(Map<String, dynamic> json) =>
      _$AuthResultFromJson(json);

  final bool isSuccess;
  final String? errorMessage;

  Map<String, dynamic> toJson() => _$AuthResultToJson(this);
}
