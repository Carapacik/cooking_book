import 'package:json_annotation/json_annotation.dart';

part 'tag_model.g.dart';

@JsonSerializable()
class Tag {
  Tag({
    required this.tagId,
    required this.name,
  });

  final int tagId;
  final String name;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
