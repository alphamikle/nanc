// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeholder_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceholderArguments _$PlaceholderArgumentsFromJson(
        Map<String, dynamic> json) =>
    PlaceholderArguments(
      color: colorFromJson(json['color'] as String?),
      height: doubleOrNullFromJson(json['height'] as String?),
      width: doubleOrNullFromJson(json['width'] as String?),
      strokeWidth: doubleOrNullFromJson(json['strokeWidth'] as String?),
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
