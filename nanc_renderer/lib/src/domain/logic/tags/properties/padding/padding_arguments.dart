import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../renderers/key_argument.dart';

part 'padding_arguments.g.dart';

@JsonSerializable()
class PaddingArguments extends KeyArgument {
  const PaddingArguments({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.all,
    required super.key,
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

  @override
  Json toJson() => _$PaddingArgumentsToJson(this);
}
