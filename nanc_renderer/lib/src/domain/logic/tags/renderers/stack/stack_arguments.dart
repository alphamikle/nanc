import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../properties/alignment/alignment_arguments.dart';

part 'stack_arguments.g.dart';

@JsonSerializable()
class StackArguments extends AlignmentArguments {
  const StackArguments({
    required this.fit,
    required super.x,
    required super.y,
    required super.align,
    required super.key,
  });

  factory StackArguments.fromJson(dynamic json) => _$StackArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final StackFit? fit;

  @override
  Json toJson() => _$StackArgumentsToJson(this);
}
