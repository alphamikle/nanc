import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'input_decoration_arguments.g.dart';

@JsonSerializable()
class InputDecorationArguments {
  const InputDecorationArguments({
    required this.fillColor,
    required this.alignLabelWithHint,
    required this.counterText,
    required this.enabled,
    required this.errorMaxLines,
    required this.errorText,
    required this.filled,
    required this.focusColor,
    required this.helperMaxLines,
    required this.helper,
    required this.hintMaxLines,
    required this.hint,
    required this.hintTextDirection,
    required this.hoverColor,
    required this.iconColor,
    required this.collapsed,
    required this.dense,
    required this.label,
    required this.prefixIconColor,
    required this.prefixText,
    required this.semanticCounterText,
    required this.suffixIconColor,
    required this.suffixText,
  });

  factory InputDecorationArguments.fromJson(dynamic json) => _$InputDecorationArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? fillColor;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? alignLabelWithHint;

  final String? counterText;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? enabled;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? errorMaxLines;

  final String? errorText;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? filled;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? focusColor;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? helperMaxLines;

  final String? helper;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? hintMaxLines;

  final String? hint;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextDirection? hintTextDirection;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? hoverColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? iconColor;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? collapsed;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? dense;

  final String? label;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? prefixIconColor;

  final String? prefixText;

  final String? semanticCounterText;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? suffixIconColor;

  final String? suffixText;

  Json toJson() => _$InputDecorationArgumentsToJson(this);
}
