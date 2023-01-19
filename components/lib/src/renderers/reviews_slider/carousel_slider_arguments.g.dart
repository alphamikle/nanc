// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_slider_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsSliderArguments _$ReviewsSliderArgumentsFromJson(
        Map<String, dynamic> json) =>
    ReviewsSliderArguments(
      height: doubleOrNullFromJson(json['height'] as String?),
      dotColor: colorFromJson(json['dotColor'] as String?),
      sliderDotGap: doubleOrNullFromJson(json['sliderDotGap'] as String?),
    );

Map<String, dynamic> _$ReviewsSliderArgumentsToJson(
        ReviewsSliderArguments instance) =>
    <String, dynamic>{
      'height': instance.height,
      'dotColor': colorToJson(instance.dotColor),
      'sliderDotGap': instance.sliderDotGap,
    };
