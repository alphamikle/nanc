import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../row/row_arguments.dart';

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
    required super.key,
  });

  factory ColumnArguments.fromJson(dynamic json) => _$ColumnArgumentsFromJson(castToJson(json));

  @override
  Json toJson() => _$ColumnArgumentsToJson(this);
}
