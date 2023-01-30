import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'placeholder_arguments.g.dart';

@JsonSerializable()
class PlaceholderArguments {
  const PlaceholderArguments({
    required this.color,
    required this.height,
    required this.width,
    required this.strokeWidth,
    required this.text,
  });

  factory PlaceholderArguments.fromJson(dynamic json) => _$PlaceholderArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? strokeWidth;

  final String? text;

  bool get hasText => text != null && text!.trim().isNotEmpty;

  Json toJson() => _$PlaceholderArgumentsToJson(this);

  @override
  String toString() => toJson().toString();
}
