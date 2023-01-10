import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'shadow_arguments.g.dart';

@JsonSerializable()
class ShadowArguments {
  const ShadowArguments({
    required this.color,
    required this.blurRadius,
    required this.spreadRadius,
    required this.offsetX,
    required this.offsetY,
    required this.blurStyle,
  });

  factory ShadowArguments.fromJson(dynamic json) => _$ShadowArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? blurRadius;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? spreadRadius;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? offsetX;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? offsetY;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final BlurStyle? blurStyle;

  BoxShadow toBoxShadow(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BoxShadow(
      color: color ?? theme.colorScheme.shadow,
      spreadRadius: spreadRadius ?? 0,
      blurRadius: blurRadius ?? 0,
      blurStyle: blurStyle ?? BlurStyle.normal,
      offset: Offset(offsetX ?? 0, offsetY ?? 0),
    );
  }

  Json toJson() => _$ShadowArgumentsToJson(this);
}
