import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rich_renderer/src/renderers/property/properties/alignment/alignment_arguments.dart';
import 'package:tools/tools.dart';

part 'stack_arguments.g.dart';

@JsonSerializable()
class StackArguments extends AlignmentArguments {
  const StackArguments({
    required this.fit,
    required super.x,
    required super.y,
    required super.align,
  });

  factory StackArguments.fromJson(dynamic json) => _$StackArgumentsFromJson(castToJson(json));

  final StackFit? fit;

  @override
  Json toJson() => _$StackArgumentsToJson(this);
}
