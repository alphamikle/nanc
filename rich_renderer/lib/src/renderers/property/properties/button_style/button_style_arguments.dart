import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rich_renderer/src/renderers/property/properties/alignment/alignment_arguments.dart';
import 'package:tools/tools.dart';

part 'button_style_arguments.g.dart';

@JsonSerializable()
class ButtonStyleArguments {
  const ButtonStyleArguments({
    required this.iconSize,
    required this.align,
    required this.elevation,
    required this.iconColor,
    required this.shadowColor,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.overlayColor,
    required this.surfaceTintColor,
  });

  factory ButtonStyleArguments.fromJson(dynamic json) => _$ButtonStyleArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? iconSize;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AlignmentEnum? align;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? elevation;

  @JsonKey(toJson: colorToJson, fromJson: nullableColorFromJson)
  final Color? iconColor;

  @JsonKey(toJson: colorToJson, fromJson: nullableColorFromJson)
  final Color? shadowColor;

  @JsonKey(toJson: colorToJson, fromJson: nullableColorFromJson)
  final Color? backgroundColor;

  @JsonKey(toJson: colorToJson, fromJson: nullableColorFromJson)
  final Color? foregroundColor;

  @JsonKey(toJson: colorToJson, fromJson: nullableColorFromJson)
  final Color? overlayColor;

  @JsonKey(toJson: colorToJson, fromJson: nullableColorFromJson)
  final Color? surfaceTintColor;

  Json toJson() => _$ButtonStyleArgumentsToJson(this);
}
