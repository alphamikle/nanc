// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipr_rect_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClipRRectArguments _$ClipRRectArgumentsFromJson(Map<String, dynamic> json) =>
    ClipRRectArguments(
      topLeft: nullableDoubleFromJson(json['topLeft'] as String?),
      topRight: nullableDoubleFromJson(json['topRight'] as String?),
      bottomRight: nullableDoubleFromJson(json['bottomRight'] as String?),
      bottomLeft: nullableDoubleFromJson(json['bottomLeft'] as String?),
      all: nullableDoubleFromJson(json['all'] as String?),
    );

Map<String, dynamic> _$ClipRRectArgumentsToJson(ClipRRectArguments instance) =>
    <String, dynamic>{
      'topLeft': instance.topLeft,
      'topRight': instance.topRight,
      'bottomRight': instance.bottomRight,
      'bottomLeft': instance.bottomLeft,
      'all': instance.all,
    };
