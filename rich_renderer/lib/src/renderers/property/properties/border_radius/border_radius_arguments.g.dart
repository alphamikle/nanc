// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_radius_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderRadiusArguments _$BorderRadiusArgumentsFromJson(
        Map<String, dynamic> json) =>
    BorderRadiusArguments(
      topLeft: doubleOrNullFromJson(json['topLeft'] as String?),
      topRight: doubleOrNullFromJson(json['topRight'] as String?),
      bottomRight: doubleOrNullFromJson(json['bottomRight'] as String?),
      bottomLeft: doubleOrNullFromJson(json['bottomLeft'] as String?),
      all: doubleOrNullFromJson(json['all'] as String?),
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
