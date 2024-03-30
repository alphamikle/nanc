import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'svg_arguments.g.dart';

@JsonSerializable()
class SvgArguments {
  const SvgArguments({
    required this.ref,
    required this.vec,
    required this.height,
    required this.width,
    required this.size,
    required this.alignment,
    required this.package,
    required this.fit,
    required this.drawOutside,
    required this.clip,
    required this.color,
    required this.matchTextDirection,
  });

  factory SvgArguments.fromJson(dynamic json) => _$SvgArgumentsFromJson(castToJson(json));

  final String? ref;
  final String? vec;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AlignmentEnum? alignment;

  final String? package;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final BoxFit? fit;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? drawOutside;

  final Clip? clip;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? matchTextDirection;

  Json toJson() => _$SvgArgumentsToJson(this);
}
