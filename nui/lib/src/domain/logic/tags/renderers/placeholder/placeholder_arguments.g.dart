// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeholder_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceholderArguments _$PlaceholderArgumentsFromJson(
        Map<String, dynamic> json) =>
    PlaceholderArguments(
      color: nullableColorFromJson(json['color'] as String?),
      height: nullableDoubleFromJson(json['height']),
      width: nullableDoubleFromJson(json['width']),
      strokeWidth: nullableDoubleFromJson(json['strokeWidth']),
      text: json['text'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$PlaceholderArgumentsToJson(
        PlaceholderArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'color': colorToJson(instance.color),
      'height': instance.height,
      'width': instance.width,
      'strokeWidth': instance.strokeWidth,
      'text': instance.text,
    };
