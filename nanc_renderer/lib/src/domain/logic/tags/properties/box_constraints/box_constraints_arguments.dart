import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'box_constraints_arguments.g.dart';

@JsonSerializable()
class BoxConstraintsArguments {
  const BoxConstraintsArguments({
    required this.maxHeight,
    required this.maxWidth,
    required this.minHeight,
    required this.minWidth,
  });

  factory BoxConstraintsArguments.fromJson(dynamic json) => _$BoxConstraintsArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? maxHeight;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? maxWidth;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? minHeight;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? minWidth;

  Json toJson() => _$BoxConstraintsArgumentsToJson(this);
}
