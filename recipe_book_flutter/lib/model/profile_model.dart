import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  const ProfileModel({
    required this.recipesCount,
    required this.likesCount,
    required this.favoritesCount,
    required this.name,
    required this.description,
    required this.login,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  final int recipesCount;
  final int likesCount;
  final int favoritesCount;
  final String name;
  final String? description;
  final String login;

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
