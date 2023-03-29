import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'list_view_arguments.g.dart';

enum ScrollPhysicsEnum {
  always,
  bouncing,
  clamping,
  fixedExtent,
  never,
  page,
  range,
}

ScrollPhysics? scrollPhysicsEnumToScrollPhysics(ScrollPhysicsEnum? physics) {
  if (physics == null) {
    return null;
  }
  if (physics == ScrollPhysicsEnum.always) {
    return const AlwaysScrollableScrollPhysics();
  } else if (physics == ScrollPhysicsEnum.bouncing) {
    return const BouncingScrollPhysics();
  } else if (physics == ScrollPhysicsEnum.clamping) {
    return const ClampingScrollPhysics();
  } else if (physics == ScrollPhysicsEnum.fixedExtent) {
    return const FixedExtentScrollPhysics();
  } else if (physics == ScrollPhysicsEnum.never) {
    return const NeverScrollableScrollPhysics();
  } else if (physics == ScrollPhysicsEnum.page) {
    return const PageScrollPhysics();
  } else if (physics == ScrollPhysicsEnum.range) {
    return const RangeMaintainingScrollPhysics();
  }
  return null;
}

@JsonSerializable()
class ListViewArguments {
  const ListViewArguments({
    required this.physics,
    required this.axis,
    required this.cacheExtent,
    required this.itemExtent,
    required this.reverse,
    required this.shrinkWrap,
  });

  factory ListViewArguments.fromJson(dynamic json) => _$ListViewArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ScrollPhysicsEnum? physics;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Axis? axis;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? cacheExtent;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? itemExtent;

  @JsonKey(defaultValue: false)
  final bool reverse;

  @JsonKey(defaultValue: false)
  final bool shrinkWrap;

  Json toJson() => _$ListViewArgumentsToJson(this);
}
