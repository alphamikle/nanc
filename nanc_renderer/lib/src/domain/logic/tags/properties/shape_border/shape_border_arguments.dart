import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'shape_border_arguments.g.dart';

@JsonSerializable()
class ShapeBorderArguments {
  const ShapeBorderArguments({
    required this.blabla,
  });

  factory ShapeBorderArguments.fromJson(dynamic json) => _$ShapeBorderArgumentsFromJson(castToJson(json));

  final String blabla;

  Json toJson() => _$ShapeBorderArgumentsToJson(this);
}
