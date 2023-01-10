import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'text_arguments.g.dart';

@JsonSerializable()
class TextArguments {
  const TextArguments({
    required this.direction,
    required this.maxLines,
    required this.align,
    required this.overflow,
    required this.softWrap,
    required this.size,
    required this.color,
  });

  factory TextArguments.fromJson(dynamic json) => _$TextArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextDirection? direction;

  @JsonKey(fromJson: intFromJson)
  final int? maxLines;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextAlign? align;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextOverflow? overflow;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? size;

  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: boolOrNullFromJson)
  final bool? softWrap;

  Json toJson() => _$TextArgumentsToJson(this);
}
