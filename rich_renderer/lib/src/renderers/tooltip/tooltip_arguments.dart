import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'tooltip_arguments.g.dart';

@JsonSerializable()
class TooltipArguments {
  const TooltipArguments({
    required this.height,
    required this.align,
    required this.text,
    required this.below,
    required this.offset,
    required this.showDuration,
    required this.waitDuration,
  });

  factory TooltipArguments.fromJson(dynamic json) => _$TooltipArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? height;

  final TextAlign? align;

  final String? text;

  @JsonKey(fromJson: boolFromJson)
  final bool below;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? offset;

  @JsonKey(fromJson: intFromJson)
  final int? showDuration;

  @JsonKey(fromJson: intFromJson)
  final int? waitDuration;

  Json toJson() => _$TooltipArgumentsToJson(this);
}
