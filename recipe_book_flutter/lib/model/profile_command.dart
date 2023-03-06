import 'package:json_annotation/json_annotation.dart';

part 'profile_command.g.dart';

@JsonSerializable()
class ProfileCommand {
  ProfileCommand({
    required this.name,
    this.description,
    required this.login,
    this.password,
  });

  String name;
  String? description;
  String login;
  String? password;

  factory ProfileCommand.fromJson(Map<String, dynamic> json) => _$ProfileCommandFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCommandToJson(this);
}
