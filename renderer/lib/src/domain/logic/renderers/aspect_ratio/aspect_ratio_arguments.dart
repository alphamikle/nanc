import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'aspect_ratio_arguments.g.dart';

@JsonSerializable()
class AspectRatioArguments {
  const AspectRatioArguments({
    required this.ratio,
  });

  factory AspectRatioArguments.fromJson(dynamic json) => _$AspectRatioArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? ratio;

  Json toJson() => _$AspectRatioArgumentsToJson(this);
}
