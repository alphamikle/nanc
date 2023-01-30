// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderArguments _$BorderArgumentsFromJson(Map<String, dynamic> json) =>
    BorderArguments(
      color: nullableColorFromJson(json['color'] as String?),
      width: nullableDoubleFromJson(json['width'] as String?),
    );

Map<String, dynamic> _$BorderArgumentsToJson(BorderArguments instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'width': instance.width,
    };
