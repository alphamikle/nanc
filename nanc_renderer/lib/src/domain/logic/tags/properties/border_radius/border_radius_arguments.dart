import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../renderers/key_argument.dart';

part 'border_radius_arguments.g.dart';

@JsonSerializable()
class BorderRadiusArguments extends KeyArgument {
  const BorderRadiusArguments({
    required this.topLeft,
    required this.topRight,
    required this.bottomRight,
    required this.bottomLeft,
    required this.all,
    required super.key,
  });

  factory BorderRadiusArguments.fromJson(dynamic json) => _$BorderRadiusArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? topLeft;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? topRight;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? bottomRight;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? bottomLeft;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? all;

  BorderRadius toBorderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(all ?? topLeft ?? 0),
      topRight: Radius.circular(all ?? topRight ?? 0),
      bottomRight: Radius.circular(all ?? bottomRight ?? 0),
      bottomLeft: Radius.circular(all ?? bottomLeft ?? 0),
    );
  }

  @override
  Json toJson() => _$BorderRadiusArgumentsToJson(this);
}
