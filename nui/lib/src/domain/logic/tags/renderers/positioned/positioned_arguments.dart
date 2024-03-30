import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'positioned_arguments.g.dart';

@JsonSerializable()
class PositionedArguments extends KeyArgument {
  const PositionedArguments({
    required this.width,
    required this.height,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.all,
    required super.key,
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

  @override
  Json toJson() => _$PositionedArgumentsToJson(this);
}
