import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'icon_arguments.g.dart';

@JsonSerializable()
class IconArguments extends KeyArgument {
  const IconArguments({
    required this.icon,
    required this.color,
    required this.size,
    required this.weight,
    required this.fill,
    required this.opticalSize,
    required super.key,
  });

  factory IconArguments.fromJson(dynamic json) => _$IconArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: IconsStorage.tryToGetIconByName, toJson: toNullJson)
  final IconData? icon;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? weight;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? fill;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? opticalSize;

  @override
  Json toJson() => _$IconArgumentsToJson(this);
}
