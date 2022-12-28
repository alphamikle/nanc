import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'decoration_arguments.g.dart';

@JsonSerializable()
class DecorationArguments {
  const DecorationArguments({
    required this.color,
    required this.blendMode,
  });

  factory DecorationArguments.fromJson(dynamic json) => _$DecorationArgumentsFromJson(castToJson(json));

  static List<String> get blendModeValues => _$BlendModeEnumMap.values.toList();

  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  final Color? color;

  final BlendMode? blendMode;

  Json toJson() => _$DecorationArgumentsToJson(this);
}
