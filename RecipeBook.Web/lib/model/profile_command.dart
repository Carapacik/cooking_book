import 'package:json_annotation/json_annotation.dart';

part 'profile_command.g.dart';

@JsonSerializable()
class ProfileCommand {
  ProfileCommand({
    required this.name,
    required this.description,
    required this.login,
    required this.password,
  });

  final String name;
  final String? description;
  final String login;
  final String password;

  factory ProfileCommand.fromJson(Map<String, dynamic> json) => _$ProfileCommandFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCommandToJson(this);
}
