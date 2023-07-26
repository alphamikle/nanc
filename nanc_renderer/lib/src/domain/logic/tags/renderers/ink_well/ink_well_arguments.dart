import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'ink_well_arguments.g.dart';

@JsonSerializable()
class InkWellArguments {
  const InkWellArguments({
    required this.onPressed,
    required this.onDoubleTap,
    required this.onLongPress,
    required this.onHover,
    required this.focusColor,
    required this.overlayColor,
    required this.highlightColor,
    required this.splashColor,
    required this.hoverColor,
  });

  factory InkWellArguments.fromJson(dynamic json) => _$InkWellArgumentsFromJson(castToJson(json));

  final String? onPressed;
  final String? onDoubleTap;
  final String? onLongPress;
  final String? onHover;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? focusColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? overlayColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? highlightColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? splashColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? hoverColor;

  Json toJson() => _$InkWellArgumentsToJson(this);
}
