import 'package:json_annotation/json_annotation.dart';

part 'user_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDetail {
  UserDetail({
    required this.id,
    required this.name,
    this.description,
    required this.login,
  });

  final int id;
  final String name;
  final String? description;
  final String login;

  factory UserDetail.fromJson(Map<String, dynamic> json) => _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
