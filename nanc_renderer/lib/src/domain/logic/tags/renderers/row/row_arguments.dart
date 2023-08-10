import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'row_arguments.g.dart';

@JsonSerializable()
class RowArguments extends KeyArgument {
  const RowArguments({
    required this.crossAxisAlignment,
    required this.mainAxisSize,
    required this.mainAxisAlignment,
    required this.verticalDirection,
    required this.textDirection,
    required this.textBaseline,
    required super.key,
  });

  factory RowArguments.fromJson(dynamic json) => _$RowArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final CrossAxisAlignment? crossAxisAlignment;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final MainAxisSize? mainAxisSize;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final MainAxisAlignment? mainAxisAlignment;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final VerticalDirection? verticalDirection;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextDirection? textDirection;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextBaseline? textBaseline;

  @override
  Json toJson() => _$RowArgumentsToJson(this);
}
