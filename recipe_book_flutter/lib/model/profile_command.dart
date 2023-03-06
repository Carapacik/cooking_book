import 'package:json_annotation/json_annotation.dart';

part 'profile_command.g.dart';

@JsonSerializable()
class ProfileCommand {
  ProfileCommand({
    required this.name,
    required this.login,
    this.description,
    this.password,
  });

  factory ProfileCommand.fromJson(Map<String, dynamic> json) =>
      _$ProfileCommandFromJson(json);

  String name;
  String? description;
  String login;
  String? password;

  Map<String, dynamic> toJson() => _$ProfileCommandToJson(this);
}
