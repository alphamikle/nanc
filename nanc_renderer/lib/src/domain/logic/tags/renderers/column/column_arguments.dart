import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/row/row_arguments.dart';
import 'package:tools/tools.dart';

part 'column_arguments.g.dart';

@JsonSerializable()
class ColumnArguments extends RowArguments {
  ColumnArguments({
    required super.crossAxisAlignment,
    required super.mainAxisAlignment,
    required super.mainAxisSize,
    required super.verticalDirection,
    required super.textDirection,
    required super.textBaseline,
  });

  factory ColumnArguments.fromJson(dynamic json) => _$ColumnArgumentsFromJson(castToJson(json));

  @override
  Json toJson() => _$ColumnArgumentsToJson(this);
}
