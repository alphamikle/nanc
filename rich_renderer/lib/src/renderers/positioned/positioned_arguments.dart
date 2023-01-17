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

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? width;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? height;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? left;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? top;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? right;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? bottom;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? all;

  Json toJson() => _$PositionedArgumentsToJson(this);
}
