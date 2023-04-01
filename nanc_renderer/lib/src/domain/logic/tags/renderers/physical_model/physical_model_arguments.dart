import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'physical_model_arguments.g.dart';

@JsonSerializable()
class PhysicalModelArguments {
  const PhysicalModelArguments({
    required this.color,
    required this.clip,
    required this.elevation,
    required this.shadowColor,
    required this.shape,
  });

  factory PhysicalModelArguments.fromJson(dynamic json) => _$PhysicalModelArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Clip? clip;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? elevation;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? shadowColor;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final BoxShape? shape;

  Json toJson() => _$PhysicalModelArgumentsToJson(this);
}
