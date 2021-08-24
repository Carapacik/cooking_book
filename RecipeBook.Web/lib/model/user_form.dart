import 'package:json_annotation/json_annotation.dart';

part 'user_form.g.dart';

@JsonSerializable()
class UserForm {
  UserForm({
    required this.name,
    required this.description,
    required this.login,
    required this.password,
  });

  final String name;
  final String? description;
  final String login;
  final String password;

  factory UserForm.fromJson(Map<String, dynamic> json) => _$UserFormFromJson(json);

  Map<String, dynamic> toJson() => _$UserFormToJson(this);
}
