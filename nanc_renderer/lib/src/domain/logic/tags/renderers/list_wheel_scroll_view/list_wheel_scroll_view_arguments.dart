import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'list_wheel_scroll_view_arguments.g.dart';

@JsonSerializable()
class ListWheelScrollViewArguments extends KeyArgument {
  const ListWheelScrollViewArguments({
    required this.axis,
    required this.itemExtent,
    required this.diameterRatio,
    required this.magnification,
    required this.offAxisFraction,
    required this.onSelectedItemChanged,
    required this.overAndUnderCenterOpacity,
    required this.perspective,
    required this.renderChildrenOutsideViewport,
    required this.squeeze,
    required this.useMagnifier,
    required super.key,
  });

  factory ListWheelScrollViewArguments.fromJson(dynamic json) => _$ListWheelScrollViewArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Axis? axis;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? itemExtent;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? diameterRatio;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? magnification;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? offAxisFraction;

  final String? onSelectedItemChanged;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? overAndUnderCenterOpacity;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? perspective;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? renderChildrenOutsideViewport;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? squeeze;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? useMagnifier;

  @override
  Json toJson() => _$ListWheelScrollViewArgumentsToJson(this);
}
