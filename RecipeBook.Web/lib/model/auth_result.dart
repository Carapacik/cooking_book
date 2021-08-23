import 'package:json_annotation/json_annotation.dart';

part 'auth_result.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResult {
  AuthResult({
    required this.isSuccess,
    required this.errorMessage,
  });

  final bool isSuccess;
  final String? errorMessage;

  factory AuthResult.fromJson(Map<String, dynamic> json) => _$AuthResultFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResultToJson(this);
}
