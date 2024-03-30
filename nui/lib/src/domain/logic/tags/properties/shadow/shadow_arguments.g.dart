// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shadow_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShadowArguments _$ShadowArgumentsFromJson(Map<String, dynamic> json) =>
    ShadowArguments(
      color: nullableColorFromJson(json['color'] as String?),
      blurRadius: nullableDoubleFromJson(json['blurRadius']),
      spreadRadius: nullableDoubleFromJson(json['spreadRadius']),
      offsetX: nullableDoubleFromJson(json['offsetX']),
      offsetY: nullableDoubleFromJson(json['offsetY']),
      blurStyle: $enumDecodeNullable(_$BlurStyleEnumMap, json['blurStyle'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
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
