import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../../../../nanc_renderer.dart';

part 'custom_scroll_view_arguments.g.dart';

@JsonSerializable()
class CustomScrollViewArguments {
  const CustomScrollViewArguments({
    required this.physics,
    required this.axis,
    required this.cacheExtent,
    required this.reverse,
    required this.shrinkWrap,
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

  Json toJson() => _$CustomScrollViewArgumentsToJson(this);
}
