// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_side_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderSideArguments _$BorderSideArgumentsFromJson(Map<String, dynamic> json) =>
    BorderSideArguments(
      color: nullableColorFromJson(json['color'] as String?),
      style: $enumDecodeNullable(_$BorderStyleEnumMap, json['style'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      width: nullableDoubleFromJson(json['width']),
      align: $enumDecodeNullable(_$StrokeAlignEnumEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$BorderSideArgumentsToJson(
        BorderSideArguments instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'style': _$BorderStyleEnumMap[instance.style],
      'width': instance.width,
      'align': _$StrokeAlignEnumEnumMap[instance.align],
    };

const _$BorderStyleEnumMap = {
  BorderStyle.none: 'none',
  BorderStyle.solid: 'solid',
};

const _$StrokeAlignEnumEnumMap = {
  StrokeAlignEnum.inside: 'inside',
  StrokeAlignEnum.center: 'center',
  StrokeAlignEnum.outside: 'outside',
};
