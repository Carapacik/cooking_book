import 'package:json_annotation/json_annotation.dart';

part 'step_model.g.dart';

@JsonSerializable()
class Step {
  Step({
    required this.stepId,
    required this.description,
    required this.recipeId,
  });

  final int stepId;
  final String description;
  final int recipeId;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

  Map<String, dynamic> toJson() => _$StepToJson(this);
}
