import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'for_arguments.g.dart';

@JsonSerializable()
class ForArguments {
  const ForArguments({
    required this.valueName,
    required this.indexName,
    required this.values,
  });

  factory ForArguments.fromJson(dynamic json) => _$ForArgumentsFromJson(castToJson(json));

  final String? valueName;
  final String? indexName;

  @JsonKey(name: 'in')
  final String? values;

  Json toJson() => _$ForArgumentsToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
