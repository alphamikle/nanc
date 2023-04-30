// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_radius_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderRadiusArguments _$BorderRadiusArgumentsFromJson(
        Map<String, dynamic> json) =>
    BorderRadiusArguments(
      topLeft: nullableDoubleFromJson(json['topLeft']),
      topRight: nullableDoubleFromJson(json['topRight']),
      bottomRight: nullableDoubleFromJson(json['bottomRight']),
      bottomLeft: nullableDoubleFromJson(json['bottomLeft']),
      all: nullableDoubleFromJson(json['all']),
    );

Map<String, dynamic> _$BorderRadiusArgumentsToJson(
        BorderRadiusArguments instance) =>
    <String, dynamic>{
      'topLeft': instance.topLeft,
      'topRight': instance.topRight,
      'bottomRight': instance.bottomRight,
      'bottomLeft': instance.bottomLeft,
      'all': instance.all,
    };
