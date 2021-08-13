import 'package:json_annotation/json_annotation.dart';

part 'user_command.g.dart';

@JsonSerializable(explicitToJson: true)
class UserCommand {
  UserCommand({
    this.name,
    this.description,
    this.login,
    this.password,
  });

  String? name;
  String? description;
  String? login;
  String? password;

  factory UserCommand.fromJson(Map<String, dynamic> json) => _$UserCommandFromJson(json);

  Map<String, dynamic> toJson() => _$UserCommandToJson(this);
}
