// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_theme_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IconThemeArguments _$IconThemeArgumentsFromJson(Map<String, dynamic> json) =>
    IconThemeArguments(
      color: nullableColorFromJson(json['color'] as String?),
      size: nullableDoubleFromJson(json['size']),
      fill: nullableDoubleFromJson(json['fill']),
      grade: nullableDoubleFromJson(json['grade']),
      opacity: nullableDoubleFromJson(json['opacity']),
      opticalSize: nullableDoubleFromJson(json['opticalSize']),
      weight: nullableDoubleFromJson(json['weight']),
    );

Map<String, dynamic> _$IconThemeArgumentsToJson(IconThemeArguments instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'size': instance.size,
      'fill': instance.fill,
      'grade': instance.grade,
      'opacity': instance.opacity,
      'opticalSize': instance.opticalSize,
      'weight': instance.weight,
    };
