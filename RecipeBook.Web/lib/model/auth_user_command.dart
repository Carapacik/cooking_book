import 'package:json_annotation/json_annotation.dart';

part 'auth_user_command.g.dart';

@JsonSerializable()
class AuthUserCommand {
  AuthUserCommand({
    this.name,
    this.login,
    this.password,
  });

  String? name;
  String? login;
  String? password;

  factory AuthUserCommand.fromJson(Map<String, dynamic> json) => _$AuthUserCommandFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserCommandToJson(this);
}
