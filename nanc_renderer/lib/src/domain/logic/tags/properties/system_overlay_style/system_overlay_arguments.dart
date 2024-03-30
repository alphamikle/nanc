import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'system_overlay_arguments.g.dart';

@JsonSerializable()
class SystemOverlayArguments {
  const SystemOverlayArguments({
    required this.statusBarBrightness,
    required this.statusBarColor,
    required this.statusBarIconBrightness,
    required this.systemNavigationBarColor,
    required this.systemNavigationBarContrastEnforced,
    required this.systemNavigationBarDividerColor,
    required this.systemNavigationBarIconBrightness,
    required this.systemStatusBarContrastEnforced,
  });

  factory SystemOverlayArguments.fromJson(dynamic json) => _$SystemOverlayArgumentsFromJson(castToJson(json));

  final Brightness? statusBarBrightness;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? statusBarColor;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Brightness? statusBarIconBrightness;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? systemNavigationBarColor;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? systemNavigationBarContrastEnforced;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? systemNavigationBarDividerColor;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Brightness? systemNavigationBarIconBrightness;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? systemStatusBarContrastEnforced;

  Json toJson() => _$SystemOverlayArgumentsToJson(this);
}
