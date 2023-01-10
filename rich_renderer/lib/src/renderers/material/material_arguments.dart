import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'material_arguments.g.dart';

@JsonSerializable()
class MaterialArguments {
  const MaterialArguments({
    required this.type,
    required this.color,
  });

  factory MaterialArguments.fromJson(dynamic json) => _$MaterialArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final MaterialType? type;

  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color? color;

  Json toJson() => _$MaterialArgumentsToJson(this);
}
