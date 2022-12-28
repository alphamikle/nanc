import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'expanded_arguments.g.dart';

@JsonSerializable()
class ExpandedArguments {
  const ExpandedArguments({
    required this.flex,
  });

  factory ExpandedArguments.fromJson(dynamic json) => _$ExpandedArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: intFromJson)
  final int? flex;

  Json toJson() => _$ExpandedArgumentsToJson(this);
}
