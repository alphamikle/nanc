import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'input_border_arguments.g.dart';

enum InputBorderType {
  outline,
  underline,
  none;
}

@JsonSerializable()
class InputBorderArguments {
  const InputBorderArguments({
    required this.type,
    required this.gap,
  });

  factory InputBorderArguments.fromJson(dynamic json) => _$InputBorderArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final InputBorderType? type;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? gap;

  Json toJson() => _$InputBorderArgumentsToJson(this);
}
