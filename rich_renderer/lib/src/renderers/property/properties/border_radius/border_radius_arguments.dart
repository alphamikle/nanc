import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'border_radius_arguments.g.dart';

@JsonSerializable()
class BorderRadiusArguments {
  const BorderRadiusArguments({
    required this.topLeft,
    required this.topRight,
    required this.bottomRight,
    required this.bottomLeft,
    required this.all,
  });

  factory BorderRadiusArguments.fromJson(dynamic json) => _$BorderRadiusArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? topLeft;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? topRight;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? bottomRight;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? bottomLeft;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? all;

  BorderRadius toBorderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(all ?? topLeft ?? 0),
      topRight: Radius.circular(all ?? topRight ?? 0),
      bottomRight: Radius.circular(all ?? bottomRight ?? 0),
      bottomLeft: Radius.circular(all ?? bottomLeft ?? 0),
    );
  }

  Json toJson() => _$BorderRadiusArgumentsToJson(this);
}
