import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'divider_arguments.g.dart';

@JsonSerializable()
class DividerArguments {
  const DividerArguments({
    required this.height,
    required this.color,
    required this.indent,
    required this.endIndent,
    required this.thickness,
  });

  factory DividerArguments.fromJson(dynamic json) => _$DividerArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? indent;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? endIndent;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? thickness;

  Json toJson() => _$DividerArgumentsToJson(this);
}
