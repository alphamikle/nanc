// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IconArguments _$IconArgumentsFromJson(Map<String, dynamic> json) =>
    IconArguments(
      icon: IconsStorage.tryToGetIconByName(json['icon'] as String?),
      color: nullableColorFromJson(json['color'] as String?),
      size: nullableDoubleFromJson(json['size']),
      weight: nullableDoubleFromJson(json['weight']),
      fill: nullableDoubleFromJson(json['fill']),
      opticalSize: nullableDoubleFromJson(json['opticalSize']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$IconArgumentsToJson(IconArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'icon': toNullJson(instance.icon),
      'color': colorToJson(instance.color),
      'size': instance.size,
      'weight': instance.weight,
      'fill': instance.fill,
      'opticalSize': instance.opticalSize,
    };
