import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../border/border_arguments.dart';

part 'border_side_arguments.g.dart';

@JsonSerializable()
class BorderSideArguments {
  const BorderSideArguments({
    required this.color,
    required this.style,
    required this.width,
    required this.align,
  });

  factory BorderSideArguments.fromJson(dynamic json) => _$BorderSideArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final BorderStyle? style;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final StrokeAlignEnum? align;

  Json toJson() => _$BorderSideArgumentsToJson(this);
}
