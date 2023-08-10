// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scale_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScaleArguments _$ScaleArgumentsFromJson(Map<String, dynamic> json) =>
    ScaleArguments(
      all: nullableDoubleFromJson(json['all']),
      scaleX: nullableDoubleFromJson(json['scaleX']),
      scaleY: nullableDoubleFromJson(json['scaleY']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$ScaleArgumentsToJson(ScaleArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'all': instance.all,
      'scaleX': instance.scaleX,
      'scaleY': instance.scaleY,
    };
