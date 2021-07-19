// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Step _$StepFromJson(Map<String, dynamic> json) {
  return Step(
    stepId: json['stepId'] as int,
    description: json['description'] as String,
    recipeId: json['recipeId'] as int,
  );
}

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'stepId': instance.stepId,
      'description': instance.description,
      'recipeId': instance.recipeId,
    };
