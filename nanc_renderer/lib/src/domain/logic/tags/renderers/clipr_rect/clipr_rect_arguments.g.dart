// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipr_rect_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClipRRectArguments _$ClipRRectArgumentsFromJson(Map<String, dynamic> json) =>
    ClipRRectArguments(
      topLeft: nullableDoubleFromJson(json['topLeft']),
      topRight: nullableDoubleFromJson(json['topRight']),
      bottomRight: nullableDoubleFromJson(json['bottomRight']),
      bottomLeft: nullableDoubleFromJson(json['bottomLeft']),
      all: nullableDoubleFromJson(json['all']),
    );

Map<String, dynamic> _$ClipRRectArgumentsToJson(ClipRRectArguments instance) =>
    <String, dynamic>{
      'topLeft': instance.topLeft,
      'topRight': instance.topRight,
      'bottomRight': instance.bottomRight,
      'bottomLeft': instance.bottomLeft,
      'all': instance.all,
    };
