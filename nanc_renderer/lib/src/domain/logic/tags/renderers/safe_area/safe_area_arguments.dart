import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'safe_area_arguments.g.dart';

@JsonSerializable()
class SafeAreaArguments {
  const SafeAreaArguments({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.bottomViewPadding,
  });

  factory SafeAreaArguments.fromJson(dynamic json) => _$SafeAreaArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? left;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? top;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? right;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? bottom;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? bottomViewPadding;

  Json toJson() => _$SafeAreaArgumentsToJson(this);
}
