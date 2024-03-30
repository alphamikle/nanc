import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import 'text_decoration_enum.dart';

part 'text_style_arguments.g.dart';

@JsonSerializable()
class TextStyleArguments {
  const TextStyleArguments({
    required this.color,
    required this.size,
    required this.height,
    required this.font,
    required this.weight,
    required this.decoration,
    required this.overflow,
    required this.baseline,
  });

  factory TextStyleArguments.fromJson(dynamic json) => _$TextStyleArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  final String? font;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final FontWeightEnum? weight;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextDecorationEnum? decoration;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextOverflow? overflow;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextBaseline? baseline;

  Json toJson() => _$TextStyleArgumentsToJson(this);
}
