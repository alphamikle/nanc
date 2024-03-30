// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'physical_model_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhysicalModelArguments _$PhysicalModelArgumentsFromJson(
        Map<String, dynamic> json) =>
    PhysicalModelArguments(
      color: nullableColorFromJson(json['color'] as String?),
      clip: $enumDecodeNullable(_$ClipEnumMap, json['clip'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      elevation: nullableDoubleFromJson(json['elevation']),
      shadowColor: nullableColorFromJson(json['shadowColor'] as String?),
      shape: $enumDecodeNullable(_$BoxShapeEnumMap, json['shape'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$PhysicalModelArgumentsToJson(
        PhysicalModelArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'color': colorToJson(instance.color),
      'clip': _$ClipEnumMap[instance.clip],
      'elevation': instance.elevation,
      'shadowColor': colorToJson(instance.shadowColor),
      'shape': _$BoxShapeEnumMap[instance.shape],
    };

const _$ClipEnumMap = {
  Clip.none: 'none',
  Clip.hardEdge: 'hardEdge',
  Clip.antiAlias: 'antiAlias',
  Clip.antiAliasWithSaveLayer: 'antiAliasWithSaveLayer',
};

const _$BoxShapeEnumMap = {
  BoxShape.rectangle: 'rectangle',
  BoxShape.circle: 'circle',
};
