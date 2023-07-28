import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'alignment_arguments.g.dart';

enum AlignmentEnum {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight;

  Alignment toAlignment() {
    return switch (this) {
      AlignmentEnum.topLeft => Alignment.topLeft,
      AlignmentEnum.topCenter => Alignment.topCenter,
      AlignmentEnum.topRight => Alignment.topRight,
      AlignmentEnum.centerLeft => Alignment.centerLeft,
      AlignmentEnum.center => Alignment.center,
      AlignmentEnum.centerRight => Alignment.centerRight,
      AlignmentEnum.bottomLeft => Alignment.bottomLeft,
      AlignmentEnum.bottomCenter => Alignment.bottomCenter,
      AlignmentEnum.bottomRight => Alignment.bottomRight,
    };
  }
}

@JsonSerializable()
class AlignmentArguments {
  const AlignmentArguments({
    required this.x,
    required this.y,
    required this.align,
  });

  factory AlignmentArguments.fromJson(dynamic json) => _$AlignmentArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? x;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? y;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AlignmentEnum? align;

  Alignment? toAlignment() {
    if (x != null && y != null) {
      return Alignment(x!, y!);
    }
    if (align != null) {
      return align!.toAlignment();
    }
    return null;
  }

  Json toJson() => _$AlignmentArgumentsToJson(this);
}
