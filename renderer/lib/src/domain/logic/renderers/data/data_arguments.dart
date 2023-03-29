import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'data_arguments.g.dart';

@JsonSerializable()
class DataArguments {
  const DataArguments({
    required this.id,
  });

  factory DataArguments.fromJson(dynamic json) => _$DataArgumentsFromJson(castToJson(json));

  final String? id;

  Json toJson() => _$DataArgumentsToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
