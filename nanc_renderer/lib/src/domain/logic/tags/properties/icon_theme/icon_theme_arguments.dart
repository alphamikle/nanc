import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'icon_theme_arguments.g.dart';

@JsonSerializable()
class IconThemeArguments {
  const IconThemeArguments({
    required this.color,
    required this.size,
    required this.fill,
    required this.grade,
    required this.opacity,
    required this.opticalSize,
    required this.weight,
  });

  factory IconThemeArguments.fromJson(dynamic json) => _$IconThemeArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? fill;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? grade;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? opacity;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? opticalSize;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? weight;

  Json toJson() => _$IconThemeArgumentsToJson(this);
}
