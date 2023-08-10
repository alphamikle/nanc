import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'aspect_ratio_arguments.g.dart';

@JsonSerializable()
class AspectRatioArguments extends KeyArgument {
  const AspectRatioArguments({
    required this.ratio,
    required super.key,
  });

  factory AspectRatioArguments.fromJson(dynamic json) => _$AspectRatioArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? ratio;

  @override
  Json toJson() => _$AspectRatioArgumentsToJson(this);
}
