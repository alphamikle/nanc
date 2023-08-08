import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'flexible_space_bar_arguments.g.dart';

@JsonSerializable()
class FlexibleSpaceBarArguments {
  const FlexibleSpaceBarArguments({
    required this.centerTitle,
    required this.collapseMode,
    required this.expandedTitleScale,
    required this.blurBackground,
    required this.fadeTitle,
    required this.zoomBackground,
  });

  factory FlexibleSpaceBarArguments.fromJson(dynamic json) => _$FlexibleSpaceBarArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? centerTitle;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final CollapseMode? collapseMode;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? expandedTitleScale;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? blurBackground;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? fadeTitle;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? zoomBackground;

  Json toJson() => _$FlexibleSpaceBarArgumentsToJson(this);
}
