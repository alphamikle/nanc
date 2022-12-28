// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipr_rect_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClipRRectArguments _$ClipRRectArgumentsFromJson(Map<String, dynamic> json) =>
    ClipRRectArguments(
      topLeft: stringToDoubleOrNull(json['topLeft'] as String?),
      topRight: stringToDoubleOrNull(json['topRight'] as String?),
      bottomRight: stringToDoubleOrNull(json['bottomRight'] as String?),
      bottomLeft: stringToDoubleOrNull(json['bottomLeft'] as String?),
      all: stringToDoubleOrNull(json['all'] as String?),
    );

Map<String, dynamic> _$ClipRRectArgumentsToJson(ClipRRectArguments instance) =>
    <String, dynamic>{
      'topLeft': instance.topLeft,
      'topRight': instance.topRight,
      'bottomRight': instance.bottomRight,
      'bottomLeft': instance.bottomLeft,
      'all': instance.all,
    };
