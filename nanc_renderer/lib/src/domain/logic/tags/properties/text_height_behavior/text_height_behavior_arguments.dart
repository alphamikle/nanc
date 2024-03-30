import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'text_height_behavior_arguments.g.dart';

@JsonSerializable()
class TextHeightBehaviorArguments {
  const TextHeightBehaviorArguments({
    required this.firstAscent,
    required this.lastDescent,
    required this.leadingDistribution,
  });

  factory TextHeightBehaviorArguments.fromJson(dynamic json) => _$TextHeightBehaviorArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? firstAscent;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? lastDescent;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextLeadingDistribution? leadingDistribution;

  Json toJson() => _$TextHeightBehaviorArgumentsToJson(this);
}
