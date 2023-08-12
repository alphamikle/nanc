import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'widget_span_arguments.g.dart';

@JsonSerializable()
class WidgetSpanArguments {
  const WidgetSpanArguments({
    required this.baseline,
    required this.alignment,
  });

  factory WidgetSpanArguments.fromJson(dynamic json) => _$WidgetSpanArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextBaseline? baseline;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final PlaceholderAlignment? alignment;

  Json toJson() => _$WidgetSpanArgumentsToJson(this);
}
