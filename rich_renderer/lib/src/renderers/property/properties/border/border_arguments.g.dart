// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderArguments _$BorderArgumentsFromJson(Map<String, dynamic> json) =>
    BorderArguments(
      color: colorFromJson(json['color'] as String?),
      width: stringToDoubleOrNull(json['width'] as String?),
      strokeAlign: $enumDecodeNullable(
          _$StrokeAlignEnumMap, json['strokeAlign'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$BorderArgumentsToJson(BorderArguments instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'width': instance.width,
      'strokeAlign': _$StrokeAlignEnumMap[instance.strokeAlign],
    };

const _$StrokeAlignEnumMap = {
  StrokeAlign.inside: 'inside',
  StrokeAlign.center: 'center',
  StrokeAlign.outside: 'outside',
};
