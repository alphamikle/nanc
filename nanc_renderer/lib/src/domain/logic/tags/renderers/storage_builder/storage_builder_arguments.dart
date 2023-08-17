import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'storage_builder_arguments.g.dart';

@JsonSerializable()
class StorageBuilderArguments {
  const StorageBuilderArguments({
    required this.buildAlways,
    required this.buildWhen,
    required this.orWhen,
    required this.andWhen,
    required this.onUpdate,
  });

  factory StorageBuilderArguments.fromJson(dynamic json) => _$StorageBuilderArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? buildAlways;

  final String? buildWhen;

  final String? orWhen;

  final String? andWhen;

  final String? onUpdate;

  Json toJson() => _$StorageBuilderArgumentsToJson(this);
}
