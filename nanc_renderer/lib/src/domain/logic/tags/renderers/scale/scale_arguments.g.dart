// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scale_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScaleArguments _$ScaleArgumentsFromJson(Map<String, dynamic> json) =>
    ScaleArguments(
      all: nullableDoubleFromJson(json['all'] as String?),
      scaleX: nullableDoubleFromJson(json['scaleX'] as String?),
      scaleY: nullableDoubleFromJson(json['scaleY'] as String?),
    );

Map<String, dynamic> _$ScaleArgumentsToJson(ScaleArguments instance) =>
    <String, dynamic>{
      'all': instance.all,
      'scaleX': instance.scaleX,
      'scaleY': instance.scaleY,
    };
