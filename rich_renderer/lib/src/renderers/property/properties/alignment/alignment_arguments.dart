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
  bottomRight,
}

@JsonSerializable()
class AlignmentArguments {
  const AlignmentArguments({
    required this.x,
    required this.y,
    required this.align,
  });

  factory AlignmentArguments.fromJson(dynamic json) => _$AlignmentArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? x;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? y;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AlignmentEnum? align;

  Alignment? toAlignment() {
    if (x != null && y != null) {
      return Alignment(x!, y!);
    }
    if (align != null) {
      if (align == AlignmentEnum.topLeft) {
        return Alignment.topLeft;
      } else if (align == AlignmentEnum.topCenter) {
        return Alignment.topCenter;
      } else if (align == AlignmentEnum.topRight) {
        return Alignment.topRight;
      } else if (align == AlignmentEnum.centerRight) {
        return Alignment.centerRight;
      } else if (align == AlignmentEnum.bottomRight) {
        return Alignment.bottomRight;
      } else if (align == AlignmentEnum.bottomCenter) {
        return Alignment.bottomCenter;
      } else if (align == AlignmentEnum.bottomLeft) {
        return Alignment.bottomLeft;
      } else if (align == AlignmentEnum.centerLeft) {
        return Alignment.centerLeft;
      } else if (align == AlignmentEnum.center) {
        return Alignment.center;
      }
    }
    return null;
  }

  Json toJson() => _$AlignmentArgumentsToJson(this);
}
