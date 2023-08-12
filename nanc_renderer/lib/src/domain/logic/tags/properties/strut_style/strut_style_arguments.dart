import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../text_style/text_decoration_enum.dart';

part 'strut_style_arguments.g.dart';

@JsonSerializable()
class StrutStyleArguments {
  const StrutStyleArguments({
    required this.height,
    required this.leading,
    required this.size,
    required this.debugLabel,
    required this.font,
    required this.weight,
    required this.forceHeight,
    required this.package,
    required this.fontStyle,
  });

  factory StrutStyleArguments.fromJson(dynamic json) => _$StrutStyleArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? leading;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  final String? debugLabel;

  final String? font;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final FontWeightEnum? weight;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? forceHeight;

  final String? package;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final FontStyle? fontStyle;

  Json toJson() => _$StrutStyleArgumentsToJson(this);
}
