import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'positioned_arguments.g.dart';

@JsonSerializable()
class PositionedArguments {
  const PositionedArguments({
    required this.width,
    required this.height,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.all,
  });

  factory PositionedArguments.fromJson(dynamic json) => _$PositionedArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? left;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? top;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? right;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? bottom;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? all;

  Json toJson() => _$PositionedArgumentsToJson(this);
}
