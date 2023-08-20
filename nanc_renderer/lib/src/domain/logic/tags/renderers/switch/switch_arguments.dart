import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../rich_text/text_span/text_span_arguments.dart';

part 'switch_arguments.g.dart';

enum Style {
  material,
  hig;

  bool get isMaterial => this == Style.material;
  bool get isCupertino => this == Style.hig;
}

@JsonSerializable()
class SwitchArguments {
  const SwitchArguments({
    required this.value,
    required this.style,
    required this.onChanged,
    required this.cursor,
    required this.activeColor,
    required this.activeTrackColor,
    required this.focusColor,
    required this.hoverColor,
    required this.inactiveThumbColor,
    required this.inactiveTrackColor,
    required this.overlayColor,
    required this.thumbColor,
    required this.trackColor,
    required this.trackOutlineColor,
    required this.trackOutlineWidth,
    required this.splashRadius,
  });

  factory SwitchArguments.fromJson(dynamic json) => _$SwitchArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? value;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Style? style;

  final String? onChanged;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final MouseCursorEnum? cursor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? activeColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? activeTrackColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? focusColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? hoverColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? inactiveThumbColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? inactiveTrackColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? overlayColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? thumbColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? trackColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? trackOutlineColor;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? trackOutlineWidth;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? splashRadius;

  Json toJson() => _$SwitchArgumentsToJson(this);
}
