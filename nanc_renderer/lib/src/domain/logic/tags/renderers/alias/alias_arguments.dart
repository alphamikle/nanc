import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'alias_arguments.g.dart';

@JsonSerializable()
class AliasArguments {
  const AliasArguments({
    required this.name,
  });

  factory AliasArguments.fromJson(dynamic json) => _$AliasArgumentsFromJson(castToJson(json));

  final String? name;

  Json toJson() => _$AliasArgumentsToJson(this);
}
