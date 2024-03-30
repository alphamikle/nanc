import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../sliver_list/sliver_list_arguments.dart';

part 'sliver_grid_arguments.g.dart';

@JsonSerializable()
class SliverGridArguments extends SliverListArguments {
  const SliverGridArguments({
    required super.addKeepAlives,
    required super.addRepaintBoundaries,
    required super.addSemanticIndexes,
    required super.extent,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.maxCrossAxisExtent,
    required super.key,
  });

  factory SliverGridArguments.fromJson(dynamic json) => _$SliverGridArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableIntFromJson)
  final int? crossAxisCount;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? childAspectRatio;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? crossAxisSpacing;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? mainAxisSpacing;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? maxCrossAxisExtent;

  @override
  Json toJson() => _$SliverGridArgumentsToJson(this);
}
