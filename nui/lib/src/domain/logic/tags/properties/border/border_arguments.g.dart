// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderArguments _$BorderArgumentsFromJson(Map<String, dynamic> json) =>
    BorderArguments(
      color: nullableColorFromJson(json['color'] as String?),
      width: nullableDoubleFromJson(json['width']),
      strokeAlign: $enumDecodeNullable(
          _$StrokeAlignEnumEnumMap, json['strokeAlign'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$BorderArgumentsToJson(BorderArguments instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'width': instance.width,
      'strokeAlign': _$StrokeAlignEnumEnumMap[instance.strokeAlign],
    };

const _$StrokeAlignEnumEnumMap = {
  StrokeAlignEnum.inside: 'inside',
  StrokeAlignEnum.center: 'center',
  StrokeAlignEnum.outside: 'outside',
};
