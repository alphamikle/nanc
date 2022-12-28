import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'row_arguments.g.dart';

@JsonSerializable()
class RowArguments {
  const RowArguments({
    required this.crossAxisAlignment,
    required this.mainAxisSize,
    required this.mainAxisAlignment,
    required this.verticalDirection,
    required this.textDirection,
    required this.textBaseline,
  });

  factory RowArguments.fromJson(dynamic json) => _$RowArgumentsFromJson(castToJson(json));

  static List<String> get crossAxisAlignmentValues => _$CrossAxisAlignmentEnumMap.values.toList();
  static List<String> get mainAxisSizeValues => _$MainAxisSizeEnumMap.values.toList();
  static List<String> get mainAxisAlignmentValues => _$MainAxisAlignmentEnumMap.values.toList();
  static List<String> get verticalDirectionValues => _$VerticalDirectionEnumMap.values.toList();
  static List<String> get textDirectionValues => _$TextDirectionEnumMap.values.toList();
  static List<String> get textBaselineValues => _$TextBaselineEnumMap.values.toList();

  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;

  Json toJson() => _$RowArgumentsToJson(this);
}
