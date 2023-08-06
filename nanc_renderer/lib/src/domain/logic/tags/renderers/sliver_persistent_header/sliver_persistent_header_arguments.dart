import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'sliver_persistent_header_arguments.g.dart';

@JsonSerializable()
class SliverPersistentHeaderArguments {
  const SliverPersistentHeaderArguments({
    required this.pinned,
    required this.floating,
    required this.maxExtent,
    required this.minExtent,
    required this.height,
  });

  factory SliverPersistentHeaderArguments.fromJson(dynamic json) => _$SliverPersistentHeaderArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? pinned;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? floating;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? maxExtent;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? minExtent;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  Json toJson() => _$SliverPersistentHeaderArgumentsToJson(this);
}
