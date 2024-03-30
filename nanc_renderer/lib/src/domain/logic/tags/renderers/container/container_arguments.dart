import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'container_arguments.g.dart';

@JsonSerializable()
class ContainerArguments extends KeyArgument {
  const ContainerArguments({
    required this.width,
    required this.height,
    required this.size,
    required this.color,
    required super.key,
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

  @override
  Json toJson() => _$ContainerArgumentsToJson(this);
}
