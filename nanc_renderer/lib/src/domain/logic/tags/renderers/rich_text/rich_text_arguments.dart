import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'rich_text_arguments.g.dart';

@JsonSerializable()
class RichTextArguments extends KeyArgument {
  const RichTextArguments({
    required this.textDirection,
    required this.overflow,
    required this.maxLines,
    required this.selectionColor,
    required this.softWrap,
    required this.align,
    required this.scaleFactor,
    required this.widthBasis,
    required this.color,
    required this.size,
    required super.key,
  });

  factory RichTextArguments.fromJson(dynamic json) => _$RichTextArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextDirection? textDirection;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextOverflow? overflow;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? maxLines;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? selectionColor;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? softWrap;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextAlign? align;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? scaleFactor;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextWidthBasis? widthBasis;

  @override
  Json toJson() => _$RichTextArgumentsToJson(this);
}
