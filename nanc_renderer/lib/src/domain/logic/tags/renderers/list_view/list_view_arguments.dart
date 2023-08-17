import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'list_view_arguments.g.dart';

enum ScrollPhysicsEnum {
  always,
  bouncing,
  clamping,
  fixedExtent,
  never,
  page,
  range;

  ScrollPhysics toScrollPhysics() {
    return switch (this) {
      ScrollPhysicsEnum.always => const AlwaysScrollableScrollPhysics(),
      ScrollPhysicsEnum.bouncing => const BouncingScrollPhysics(),
      ScrollPhysicsEnum.clamping => const ClampingScrollPhysics(),
      ScrollPhysicsEnum.fixedExtent => const FixedExtentScrollPhysics(),
      ScrollPhysicsEnum.never => const NeverScrollableScrollPhysics(),
      ScrollPhysicsEnum.page => const PageScrollPhysics(),
      ScrollPhysicsEnum.range => const RangeMaintainingScrollPhysics(),
    };
  }

  bool get isFixedExtent => this == ScrollPhysicsEnum.fixedExtent;
}

@JsonSerializable()
class ListViewArguments extends KeyArgument {
  const ListViewArguments({
    required this.physics,
    required this.axis,
    required this.cacheExtent,
    required this.itemExtent,
    required this.reverse,
    required this.shrinkWrap,
    required super.key,
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

  @override
  Json toJson() => _$ListViewArgumentsToJson(this);
}
