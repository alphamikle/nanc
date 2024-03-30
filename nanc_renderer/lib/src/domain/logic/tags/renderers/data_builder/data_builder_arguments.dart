import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'data_builder_arguments.g.dart';

@JsonSerializable()
class DataBuilderArguments {
  const DataBuilderArguments({
    required this.buildAlways,
    required this.buildWhen,
    required this.orWhen,
    required this.andWhen,
    required this.onUpdate,
  });

  factory DataBuilderArguments.fromJson(dynamic json) => _$DataBuilderArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? buildAlways;

  final String? buildWhen;

  final String? orWhen;

  final String? andWhen;

  final String? onUpdate;

  Json toJson() => _$DataBuilderArgumentsToJson(this);
}
