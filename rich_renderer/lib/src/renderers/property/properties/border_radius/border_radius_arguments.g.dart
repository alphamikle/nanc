// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_radius_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderRadiusArguments _$BorderRadiusArgumentsFromJson(
        Map<String, dynamic> json) =>
    BorderRadiusArguments(
      topLeft: stringToDoubleOrNull(json['topLeft'] as String?),
      topRight: stringToDoubleOrNull(json['topRight'] as String?),
      bottomRight: stringToDoubleOrNull(json['bottomRight'] as String?),
      bottomLeft: stringToDoubleOrNull(json['bottomLeft'] as String?),
      all: stringToDoubleOrNull(json['all'] as String?),
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
