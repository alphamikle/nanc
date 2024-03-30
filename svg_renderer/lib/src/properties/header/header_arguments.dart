import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'header_arguments.g.dart';

@JsonSerializable()
class HeaderArguments {
  const HeaderArguments({
    required this.name,
    required this.value,
  });

  factory HeaderArguments.fromJson(dynamic json) => _$HeaderArgumentsFromJson(castToJson(json));

  final String? name;
  final String? value;

  bool get isEmpty => name == null || value == null || name!.isEmpty || value!.isEmpty;

  Json toJson() => _$HeaderArgumentsToJson(this);
}
