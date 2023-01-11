// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerArguments _$ContainerArgumentsFromJson(Map<String, dynamic> json) =>
    ContainerArguments(
      width: stringToDoubleOrNull(json['width'] as String?),
      height: stringToDoubleOrNull(json['height'] as String?),
      size: stringToDoubleOrNull(json['size'] as String?),
      color: colorFromJson(json['color'] as String?),
    );

Map<String, dynamic> _$ContainerArgumentsToJson(ContainerArguments instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'color': colorToJson(instance.color),
    };
