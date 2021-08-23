import 'package:json_annotation/json_annotation.dart';
import 'package:recipebook/model/user_form.dart';

part 'profile_detail.g.dart';

@JsonSerializable()
class ProfileDetail {
  ProfileDetail({
    required this.recipesCount,
    required this.likesCount,
    required this.favoritesCount,
    required this.userForm,
  });

  final int recipesCount;
  final int likesCount;
  final int favoritesCount;
  final UserForm userForm;

  factory ProfileDetail.fromJson(Map<String, dynamic> json) => _$ProfileDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDetailToJson(this);
}
