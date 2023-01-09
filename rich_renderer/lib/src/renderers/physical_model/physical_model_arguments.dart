import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'physical_model_arguments.g.dart';

class PhysicalModelArguments {
  const PhysicalModelArguments({
    required this.color,
    required this.clip,
    required this.elevation,
    required this.shadowColor,
    required this.shape,
  });

  factory PhysicalModelArguments.fromJson(dynamic json) => _$PhysicalModelArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: colorFromJson)
  final Color? color;

  final Clip? clip;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? elevation;

  @JsonKey(fromJson: colorFromJson)
  final Color? shadowColor;

  final BoxShape? shape;

  Json toJson() => _$PhysicalModelArgumentsToJson(this);
}
