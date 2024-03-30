import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'template_arguments.g.dart';

@JsonSerializable()
class TemplateArguments {
  const TemplateArguments({
    required this.id,
    required this.arguments,
  });

  factory TemplateArguments.fromJson(dynamic json) => _$TemplateArgumentsFromJson(castToJson(json));

  final String? id;
  final Map<String, String>? arguments;

  Json toJson() => _$TemplateArgumentsToJson(this);
}
