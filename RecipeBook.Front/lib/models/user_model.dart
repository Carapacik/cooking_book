import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  User({
    required this.userId,
    required this.name,
    required this.description,
    required this.login,
    required this.password,
  });

  final int userId;
  final String name;
  final String description;
  final String login;
  final String password;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
