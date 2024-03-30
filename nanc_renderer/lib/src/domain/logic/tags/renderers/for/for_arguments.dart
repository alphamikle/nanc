import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'for_arguments.g.dart';

@JsonSerializable()
class ForArguments {
  const ForArguments({
    required this.valueName,
    required this.indexName,
    required this.values,
    required this.oldValues,
    required this.from,
    required this.to,
  });

  factory ForArguments.fromJson(dynamic json) => _$ForArgumentsFromJson(castToJson(json));

  final String? valueName;
  final String? indexName;

  @JsonKey(name: 'in')
  final String? values;

  @JsonKey(name: 'in_old')
  final String? oldValues;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? from;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? to;

  Json toJson() => _$ForArgumentsToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
