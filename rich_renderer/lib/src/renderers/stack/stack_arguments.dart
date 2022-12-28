import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rich_renderer/src/renderers/property/properties/alignment/alignment_arguments.dart';
import 'package:tools/tools.dart';

part 'stack_arguments.g.dart';

@JsonSerializable()
class StackArguments implements AlignmentArguments {
  const StackArguments({
    required this.fit,
    required this.x,
    required this.y,
    required this.align,
  });

  factory StackArguments.fromJson(dynamic json) => _$StackArgumentsFromJson(castToJson(json));

  final StackFit? fit;

  @override
  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? x;

  @override
  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? y;

  @override
  final AlignmentEnum? align;

  @override
  Alignment? toAlignment() {
    return AlignmentArguments.fromJson(toJson()).toAlignment();
  }

  @override
  Json toJson() => _$StackArgumentsToJson(this);
}
