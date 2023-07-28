import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'color_filter_arguments.g.dart';

@JsonSerializable()
class ColorFilterArguments {
  const ColorFilterArguments({
    required this.color,
    required this.mode,
  });

  factory ColorFilterArguments.fromJson(dynamic json) => _$ColorFilterArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final BlendMode? mode;

  Json toJson() => _$ColorFilterArgumentsToJson(this);
}
