// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IconArguments _$IconArgumentsFromJson(Map<String, dynamic> json) =>
    IconArguments(
      icon: tryToGetIconPathByName(json['icon'] as String?),
      color: colorFromJson(json['color'] as String?),
      size: stringToDoubleOrNull(json['size'] as String?),
    );

Map<String, dynamic> _$IconArgumentsToJson(IconArguments instance) =>
    <String, dynamic>{
      'icon': toNullJson(instance.icon),
      'color': colorToJson(instance.color),
      'size': instance.size,
    };
