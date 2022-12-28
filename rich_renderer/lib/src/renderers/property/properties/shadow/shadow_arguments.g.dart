// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shadow_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShadowArguments _$ShadowArgumentsFromJson(Map<String, dynamic> json) =>
    ShadowArguments(
      color: colorFromJson(json['color'] as String?),
      blurRadius: stringToDoubleOrNull(json['blurRadius'] as String?),
      spreadRadius: stringToDoubleOrNull(json['spreadRadius'] as String?),
      offsetX: stringToDoubleOrNull(json['offsetX'] as String?),
      offsetY: stringToDoubleOrNull(json['offsetY'] as String?),
      blurStyle: $enumDecodeNullable(_$BlurStyleEnumMap, json['blurStyle']),
    );

Map<String, dynamic> _$ShadowArgumentsToJson(ShadowArguments instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'blurRadius': instance.blurRadius,
      'spreadRadius': instance.spreadRadius,
      'offsetX': instance.offsetX,
      'offsetY': instance.offsetY,
      'blurStyle': _$BlurStyleEnumMap[instance.blurStyle],
    };

const _$BlurStyleEnumMap = {
  BlurStyle.normal: 'normal',
  BlurStyle.solid: 'solid',
  BlurStyle.outer: 'outer',
  BlurStyle.inner: 'inner',
};
