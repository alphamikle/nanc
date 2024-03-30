import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'decoration_arguments.g.dart';

@JsonSerializable()
class DecorationArguments {
  const DecorationArguments({
    required this.color,
    required this.blendMode,
  });

  factory DecorationArguments.fromJson(dynamic json) => _$DecorationArgumentsFromJson(castToJson(json));

  @JsonKey(toJson: colorToJson, fromJson: nullableColorFromJson)
  final Color? color;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final BlendMode? blendMode;

  Json toJson() => _$DecorationArgumentsToJson(this);
}
