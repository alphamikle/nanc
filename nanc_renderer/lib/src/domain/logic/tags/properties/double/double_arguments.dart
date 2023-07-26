import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'double_arguments.g.dart';

@JsonSerializable()
class DoubleArguments {
  const DoubleArguments({
    required this.value,
  });

  factory DoubleArguments.fromJson(dynamic json) => _$DoubleArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? value;

  Json toJson() => _$DoubleArgumentsToJson(this);
}
