import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'component_arguments.g.dart';

@JsonSerializable()
class ComponentArguments {
  const ComponentArguments({
    required this.id,
  });

  factory ComponentArguments.fromJson(dynamic json) => _$ComponentArgumentsFromJson(castToJson(json));

  final String? id;

  Json toJson() => _$ComponentArgumentsToJson(this);
}
