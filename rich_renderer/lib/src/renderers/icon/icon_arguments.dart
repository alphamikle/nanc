import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'icon_arguments.g.dart';

@JsonSerializable()
class IconArguments {
  const IconArguments({
    required this.icon,
    required this.color,
    required this.size,
  });

  factory IconArguments.fromJson(dynamic json) => _$IconArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: tryToGetIconPathByName, toJson: toNullJson)
  final String? icon;

  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? size;

  Json toJson() => _$IconArgumentsToJson(this);
}
