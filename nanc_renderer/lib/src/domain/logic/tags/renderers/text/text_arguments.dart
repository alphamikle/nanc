import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'text_arguments.g.dart';

@JsonSerializable()
class TextArguments extends KeyArgument {
  const TextArguments({
    required this.direction,
    required this.maxLines,
    required this.align,
    required this.overflow,
    required this.softWrap,
    required this.size,
    required this.color,
    required super.key,
  });

  factory TextArguments.fromJson(dynamic json) => _$TextArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextDirection? direction;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? maxLines;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextAlign? align;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextOverflow? overflow;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? softWrap;

  @override
  Json toJson() => _$TextArgumentsToJson(this);
}
