// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialArguments _$MaterialArgumentsFromJson(Map<String, dynamic> json) =>
    MaterialArguments(
      type: $enumDecodeNullable(_$MaterialTypeEnumMap, json['type'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      color: nullableColorFromJson(json['color'] as String?),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$MaterialArgumentsToJson(MaterialArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'type': _$MaterialTypeEnumMap[instance.type],
      'color': colorToJson(instance.color),
    };

const _$MaterialTypeEnumMap = {
  MaterialType.canvas: 'canvas',
  MaterialType.card: 'card',
  MaterialType.circle: 'circle',
  MaterialType.button: 'button',
  MaterialType.transparency: 'transparency',
};
