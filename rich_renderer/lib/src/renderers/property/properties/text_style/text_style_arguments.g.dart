// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextStyleArguments _$TextStyleArgumentsFromJson(Map<String, dynamic> json) =>
    TextStyleArguments(
      color: colorFromJson(json['color'] as String?),
      size: doubleOrNullFromJson(json['size'] as String?),
      height: doubleOrNullFromJson(json['height'] as String?),
      font: json['font'] as String?,
      weight: $enumDecodeNullable(_$FontWeightEnumEnumMap, json['weight'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      decoration: $enumDecodeNullable(
          _$TextDecorationEnumEnumMap, json['decoration'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      overflow: $enumDecodeNullable(_$TextOverflowEnumMap, json['overflow'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      baseline: $enumDecodeNullable(_$TextBaselineEnumMap, json['baseline'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$TextStyleArgumentsToJson(TextStyleArguments instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'size': instance.size,
      'height': instance.height,
      'font': instance.font,
      'weight': _$FontWeightEnumEnumMap[instance.weight],
      'decoration': _$TextDecorationEnumEnumMap[instance.decoration],
      'overflow': _$TextOverflowEnumMap[instance.overflow],
      'baseline': _$TextBaselineEnumMap[instance.baseline],
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

const _$TextDecorationEnumEnumMap = {
  TextDecorationEnum.none: 'none',
  TextDecorationEnum.underline: 'underline',
  TextDecorationEnum.overline: 'overline',
  TextDecorationEnum.lineThrough: 'lineThrough',
};

const _$TextOverflowEnumMap = {
  TextOverflow.clip: 'clip',
  TextOverflow.fade: 'fade',
  TextOverflow.ellipsis: 'ellipsis',
  TextOverflow.visible: 'visible',
};

const _$TextBaselineEnumMap = {
  TextBaseline.alphabetic: 'alphabetic',
  TextBaseline.ideographic: 'ideographic',
};
