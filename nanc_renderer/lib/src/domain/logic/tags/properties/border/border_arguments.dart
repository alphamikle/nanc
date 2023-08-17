import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'border_arguments.g.dart';

enum StrokeAlignEnum {
  inside,
  center,
  outside;

  double toStrokeAlign() {
    return switch (this) {
      StrokeAlignEnum.inside => BorderSide.strokeAlignInside,
      StrokeAlignEnum.center => BorderSide.strokeAlignCenter,
      StrokeAlignEnum.outside => BorderSide.strokeAlignOutside,
    };
  }
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
      strokeAlign: strokeAlign?.toStrokeAlign() ?? BorderSide.strokeAlignInside,
      width: width ?? 1,
    );
  }

  Json toJson() => _$BorderArgumentsToJson(this);
}
