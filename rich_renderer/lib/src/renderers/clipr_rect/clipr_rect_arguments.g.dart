// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipr_rect_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClipRRectArguments _$ClipRRectArgumentsFromJson(Map<String, dynamic> json) =>
    ClipRRectArguments(
      topLeft: doubleOrNullFromJson(json['topLeft'] as String?),
      topRight: doubleOrNullFromJson(json['topRight'] as String?),
      bottomRight: doubleOrNullFromJson(json['bottomRight'] as String?),
      bottomLeft: doubleOrNullFromJson(json['bottomLeft'] as String?),
      all: doubleOrNullFromJson(json['all'] as String?),
    );

Map<String, dynamic> _$ClipRRectArgumentsToJson(ClipRRectArguments instance) =>
    <String, dynamic>{
      'topLeft': instance.topLeft,
      'topRight': instance.topRight,
      'bottomRight': instance.bottomRight,
      'bottomLeft': instance.bottomLeft,
      'all': instance.all,
    };
