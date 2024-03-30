import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'image_arguments.g.dart';

@JsonSerializable()
class ImageArguments extends KeyArgument {
  const ImageArguments({
    required this.ref,
    required this.color,
    required this.width,
    required this.height,
    required this.fit,
    required this.blurHash,
    required super.key,
    this.useCache = true,
  });

  factory ImageArguments.fromJson(dynamic json) => _$ImageArgumentsFromJson(castToJson(json));

  final String? ref;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final BoxFit? fit;

  final String? blurHash;

  @JsonKey(fromJson: boolFromJson)
  final bool useCache;

  @override
  Json toJson() => _$ImageArgumentsToJson(this);
}
