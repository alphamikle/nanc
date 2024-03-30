import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../../../nui.dart';

part 'custom_scroll_view_arguments.g.dart';

@JsonSerializable()
class CustomScrollViewArguments extends KeyArgument {
  const CustomScrollViewArguments({
    required this.physics,
    required this.axis,
    required this.cacheExtent,
    required this.reverse,
    required this.shrinkWrap,
    required super.key,
  });

  factory CustomScrollViewArguments.fromJson(dynamic json) => _$CustomScrollViewArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ScrollPhysicsEnum? physics;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Axis? axis;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? cacheExtent;

  @JsonKey(defaultValue: false)
  final bool reverse;

  @JsonKey(defaultValue: false)
  final bool shrinkWrap;

  @override
  Json toJson() => _$CustomScrollViewArgumentsToJson(this);
}
