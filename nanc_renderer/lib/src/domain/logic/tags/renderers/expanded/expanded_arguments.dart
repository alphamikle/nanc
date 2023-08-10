import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'expanded_arguments.g.dart';

@JsonSerializable()
class ExpandedArguments extends KeyArgument {
  const ExpandedArguments({
    required this.flex,
    required super.key,
  });

  factory ExpandedArguments.fromJson(dynamic json) => _$ExpandedArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableIntFromJson)
  final int? flex;

  @override
  Json toJson() => _$ExpandedArgumentsToJson(this);
}
