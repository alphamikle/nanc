import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'carousel_slider_arguments.g.dart';

@JsonSerializable()
class ReviewsSliderArguments {
  const ReviewsSliderArguments({
    required this.height,
    required this.dotColor,
    required this.sliderDotGap,
  });

  factory ReviewsSliderArguments.fromJson(dynamic json) => _$ReviewsSliderArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? height;

  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color? dotColor;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? sliderDotGap;

  Json toJson() => _$ReviewsSliderArgumentsToJson(this);
}
