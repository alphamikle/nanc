import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'code_arguments.g.dart';

@JsonSerializable()
class CodeArguments {
  const CodeArguments({
    required this.language,
  });

  factory CodeArguments.fromJson(dynamic json) => _$CodeArgumentsFromJson(castToJson(json));

  final String? language;

  Json toJson() => _$CodeArgumentsToJson(this);
}
