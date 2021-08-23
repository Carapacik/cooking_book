import 'package:json_annotation/json_annotation.dart';

part 'auth_user_command.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthUserCommand {
  AuthUserCommand({
    this.name,
    this.description,
    this.login,
    this.password,
  });

  String? name;
  String? description;
  String? login;
  String? password;

  factory AuthUserCommand.fromJson(Map<String, dynamic> json) => _$AuthUserCommandFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserCommandToJson(this);
}
