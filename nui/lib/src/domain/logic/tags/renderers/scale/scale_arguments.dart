import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'scale_arguments.g.dart';

@JsonSerializable()
class ScaleArguments extends KeyArgument {
  const ScaleArguments({
    required this.all,
    required this.scaleX,
    required this.scaleY,
    required super.key,
  });

  factory ScaleArguments.fromJson(dynamic json) => _$ScaleArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? all;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? scaleX;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? scaleY;

  @override
  Json toJson() => _$ScaleArgumentsToJson(this);
}
