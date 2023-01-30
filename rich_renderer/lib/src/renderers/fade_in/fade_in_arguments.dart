import 'package:json_annotation/json_annotation.dart';
import 'package:rich_renderer/src/renderers/fade_in/curve_enum.dart';
import 'package:tools/tools.dart';

part 'fade_in_arguments.g.dart';

@JsonSerializable()
class FadeInArguments {
  const FadeInArguments({
    required this.duration,
    required this.delay,
    required this.curve,
  });

  factory FadeInArguments.fromJson(dynamic json) => _$FadeInArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableIntFromJson)
  final int? duration;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? delay;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final CurveEnum? curve;

  Json toJson() => _$FadeInArgumentsToJson(this);
}
