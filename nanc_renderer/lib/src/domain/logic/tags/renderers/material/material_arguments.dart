import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'material_arguments.g.dart';

@JsonSerializable()
class MaterialArguments extends KeyArgument {
  const MaterialArguments({
    required this.type,
    required this.color,
    required super.key,
  });

  factory MaterialArguments.fromJson(dynamic json) => _$MaterialArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final MaterialType? type;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @override
  Json toJson() => _$MaterialArgumentsToJson(this);
}
