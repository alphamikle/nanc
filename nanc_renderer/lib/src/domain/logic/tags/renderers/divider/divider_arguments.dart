import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'divider_arguments.g.dart';

@JsonSerializable()
class DividerArguments {
  const DividerArguments({
    required this.height,
    required this.width,
  });

  factory DividerArguments.fromJson(dynamic json) => _$DividerArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  Json toJson() => _$DividerArgumentsToJson(this);
}