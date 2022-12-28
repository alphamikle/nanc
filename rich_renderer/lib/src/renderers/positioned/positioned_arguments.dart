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

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? width;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? height;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? left;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? top;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? right;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? bottom;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? all;

  Json toJson() => _$PositionedArgumentsToJson(this);
}
