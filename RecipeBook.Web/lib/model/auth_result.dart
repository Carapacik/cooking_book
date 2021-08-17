import 'package:json_annotation/json_annotation.dart';

part 'auth_result.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResult {
  AuthResult({
    required this.result,
    required this.error,
  });

  final bool result;
  final String? error;

  factory AuthResult.fromJson(Map<String, dynamic> json) => _$AuthResultFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResultToJson(this);
}
