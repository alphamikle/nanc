import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'sliver_list_arguments.g.dart';

@JsonSerializable()
class SliverListArguments {
  const SliverListArguments({
    required this.addKeepAlives,
    required this.addRepaintBoundaries,
    required this.addSemanticIndexes,
    required this.extent,
  });

  factory SliverListArguments.fromJson(dynamic json) => _$SliverListArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? addKeepAlives;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? addRepaintBoundaries;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? addSemanticIndexes;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? extent;

  Json toJson() => _$SliverListArgumentsToJson(this);
}
