import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'color_arguments.g.dart';

@JsonSerializable()
class ColorArguments {
  const ColorArguments({
    required this.color,
  });

  factory ColorArguments.fromJson(dynamic json) => _$ColorArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color? color;

  Json toJson() => _$ColorArgumentsToJson(this);
}
