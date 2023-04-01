import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'padding_arguments.g.dart';

@JsonSerializable()
class PaddingArguments {
  const PaddingArguments({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.all,
  });

  factory PaddingArguments.fromJson(dynamic json) => _$PaddingArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? left;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? top;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? right;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? bottom;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? all;

  EdgeInsets toPadding() => EdgeInsets.fromLTRB(all ?? left ?? 0, all ?? top ?? 0, all ?? right ?? 0, all ?? bottom ?? 0);

  Json toJson() => _$PaddingArgumentsToJson(this);
}