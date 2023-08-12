import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'default_text_style_arguments.g.dart';

@JsonSerializable()
class DefaultTextStyleArguments extends KeyArgument {
  const DefaultTextStyleArguments({
    required this.overflow,
    required this.maxLines,
    required this.softWrap,
    required this.align,
    required this.size,
    required this.color,
    required this.widthBasis,
    required super.key,
  });

  factory DefaultTextStyleArguments.fromJson(dynamic json) => _$DefaultTextStyleArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextOverflow? overflow;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? maxLines;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? softWrap;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextAlign? align;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextWidthBasis? widthBasis;

  @override
  Json toJson() => _$DefaultTextStyleArgumentsToJson(this);
}
