import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'sliver_app_bar_arguments.g.dart';

@JsonSerializable()
class SliverAppBarArguments extends KeyArgument {
  const SliverAppBarArguments({
    required this.floating,
    required this.pinned,
    required this.backgroundColor,
    required this.shadowColor,
    required this.surfaceTintColor,
    required this.elevation,
    required this.autoLeading,
    required this.centerTitle,
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.forceElevated,
    required this.forceMaterialTransparency,
    required this.foregroundColor,
    required this.leadingWidth,
    required this.snap,
    required this.stretch,
    required this.onStretchTrigger,
    required this.scrolledUnderElevation,
    required this.stretchTriggerOffset,
    required this.titleSpacing,
    required this.toolbarHeight,
    required super.key,
  });

  factory SliverAppBarArguments.fromJson(dynamic json) => _$SliverAppBarArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? floating;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? pinned;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? backgroundColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? shadowColor;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? surfaceTintColor;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? elevation;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? autoLeading;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? centerTitle;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? collapsedHeight;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? expandedHeight;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? forceElevated;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? forceMaterialTransparency;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? foregroundColor;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? leadingWidth;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? snap;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? stretch;

  final String? onStretchTrigger;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? scrolledUnderElevation;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? stretchTriggerOffset;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? titleSpacing;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? toolbarHeight;

  @override
  Json toJson() => _$SliverAppBarArgumentsToJson(this);
}
