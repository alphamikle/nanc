import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'border_arguments.g.dart';

enum StrokeAlignEnum {
  inside,
  center,
  outside,
}

double strokeAlignEnumToStrokeAlign(StrokeAlignEnum? alignEnum) {
  return switch (alignEnum) {
    StrokeAlignEnum.inside => BorderSide.strokeAlignInside,
    StrokeAlignEnum.center => BorderSide.strokeAlignCenter,
    StrokeAlignEnum.outside => BorderSide.strokeAlignOutside,
    _ => BorderSide.strokeAlignInside,
  };
}

@JsonSerializable()
class BorderArguments {
  const BorderArguments({
    required this.color,
    required this.width,
    required this.strokeAlign,
  });

  factory BorderArguments.fromJson(dynamic json) => _$BorderArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final StrokeAlignEnum? strokeAlign;

  BoxBorder toBorder(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Border.all(
      color: color ?? theme.colorScheme.outline,
      strokeAlign: strokeAlignEnumToStrokeAlign(strokeAlign),
      width: width ?? 1,
    );
  }

  Json toJson() => _$BorderArgumentsToJson(this);
}
