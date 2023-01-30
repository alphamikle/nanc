// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeholder_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceholderArguments _$PlaceholderArgumentsFromJson(
        Map<String, dynamic> json) =>
    PlaceholderArguments(
      color: nullableColorFromJson(json['color'] as String?),
      height: nullableDoubleFromJson(json['height'] as String?),
      width: nullableDoubleFromJson(json['width'] as String?),
      strokeWidth: nullableDoubleFromJson(json['strokeWidth'] as String?),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$PlaceholderArgumentsToJson(
        PlaceholderArguments instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'height': instance.height,
      'width': instance.width,
      'strokeWidth': instance.strokeWidth,
      'text': instance.text,
    };
