import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'fractional_translation_arguments.g.dart';

@JsonSerializable()
class FractionalTranslationArguments {
  const FractionalTranslationArguments({
    required this.dx,
    required this.dy,
  });

  factory FractionalTranslationArguments.fromJson(dynamic json) => _$FractionalTranslationArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? dx;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? dy;

  Offset? toOffset() {
    if (dx != null && dy != null) {
      return Offset(dx!, dy!);
    }
    return null;
  }

  Json toJson() => _$FractionalTranslationArgumentsToJson(this);
}
