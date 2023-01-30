import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'container_arguments.g.dart';

@JsonSerializable()
class ContainerArguments {
  const ContainerArguments({
    required this.width,
    required this.height,
    required this.size,
    required this.color,
  });

  factory ContainerArguments.fromJson(dynamic json) => _$ContainerArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  Json toJson() => _$ContainerArgumentsToJson(this);
}
