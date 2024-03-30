import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';
import 'curve_enum.dart';

part 'fade_in_arguments.g.dart';

@JsonSerializable()
class FadeInArguments extends KeyArgument {
  const FadeInArguments({
    required this.duration,
    required this.delay,
    required this.curve,
    required super.key,
  });

  factory FadeInArguments.fromJson(dynamic json) => _$FadeInArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableIntFromJson)
  final int? duration;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? delay;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final CurveEnum? curve;

  @override
  Json toJson() => _$FadeInArgumentsToJson(this);
}
