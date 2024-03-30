// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strut_style_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrutStyleArguments _$StrutStyleArgumentsFromJson(Map<String, dynamic> json) =>
    StrutStyleArguments(
      height: nullableDoubleFromJson(json['height']),
      leading: nullableDoubleFromJson(json['leading']),
      size: nullableDoubleFromJson(json['size']),
      debugLabel: json['debugLabel'] as String?,
      font: json['font'] as String?,
      weight: $enumDecodeNullable(_$FontWeightEnumEnumMap, json['weight'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      forceHeight: nullableBoolFromJson(json['forceHeight']),
      package: json['package'] as String?,
      fontStyle: $enumDecodeNullable(_$FontStyleEnumMap, json['fontStyle'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$StrutStyleArgumentsToJson(
        StrutStyleArguments instance) =>
    <String, dynamic>{
      'height': instance.height,
      'leading': instance.leading,
      'size': instance.size,
      'debugLabel': instance.debugLabel,
      'font': instance.font,
      'weight': _$FontWeightEnumEnumMap[instance.weight],
      'forceHeight': instance.forceHeight,
      'package': instance.package,
      'fontStyle': _$FontStyleEnumMap[instance.fontStyle],
    };

const _$FontWeightEnumEnumMap = {
  FontWeightEnum.w100: 'w100',
  FontWeightEnum.w200: 'w200',
  FontWeightEnum.w300: 'w300',
  FontWeightEnum.w400: 'w400',
  FontWeightEnum.w500: 'w500',
  FontWeightEnum.w600: 'w600',
  FontWeightEnum.w700: 'w700',
  FontWeightEnum.w800: 'w800',
  FontWeightEnum.w900: 'w900',
  FontWeightEnum.normal: 'normal',
  FontWeightEnum.bold: 'bold',
};

const _$FontStyleEnumMap = {
  FontStyle.normal: 'normal',
  FontStyle.italic: 'italic',
};
