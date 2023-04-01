// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_radius_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderRadiusArguments _$BorderRadiusArgumentsFromJson(
        Map<String, dynamic> json) =>
    BorderRadiusArguments(
      topLeft: nullableDoubleFromJson(json['topLeft'] as String?),
      topRight: nullableDoubleFromJson(json['topRight'] as String?),
      bottomRight: nullableDoubleFromJson(json['bottomRight'] as String?),
      bottomLeft: nullableDoubleFromJson(json['bottomLeft'] as String?),
      all: nullableDoubleFromJson(json['all'] as String?),
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
