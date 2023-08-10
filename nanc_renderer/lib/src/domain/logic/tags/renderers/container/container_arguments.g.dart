// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerArguments _$ContainerArgumentsFromJson(Map<String, dynamic> json) =>
    ContainerArguments(
      width: nullableDoubleFromJson(json['width']),
      height: nullableDoubleFromJson(json['height']),
      size: nullableDoubleFromJson(json['size']),
      color: nullableColorFromJson(json['color'] as String?),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$ContainerArgumentsToJson(ContainerArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'color': colorToJson(instance.color),
    };
