import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'border_arguments.g.dart';

@JsonSerializable()
class BorderArguments {
  const BorderArguments({
    required this.color,
    required this.width,
    required this.strokeAlign,
  });

  factory BorderArguments.fromJson(dynamic json) => _$BorderArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? width;

  final StrokeAlign? strokeAlign;

  BoxBorder toBorder(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Border.all(
      color: color ?? theme.colorScheme.outline,
      strokeAlign: strokeAlign ?? StrokeAlign.inside,
      width: width ?? 1,
    );
  }

  Json toJson() => _$BorderArgumentsToJson(this);
}
