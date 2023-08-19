// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_text_style_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultTextStyleArguments _$DefaultTextStyleArgumentsFromJson(
        Map<String, dynamic> json) =>
    DefaultTextStyleArguments(
      overflow: $enumDecodeNullable(_$TextOverflowEnumMap, json['overflow'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      maxLines: nullableIntFromJson(json['maxLines']),
      softWrap: nullableBoolFromJson(json['softWrap']),
      align: $enumDecodeNullable(_$TextAlignEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      size: nullableDoubleFromJson(json['size']),
      color: nullableColorFromJson(json['color'] as String?),
      widthBasis: $enumDecodeNullable(
          _$TextWidthBasisEnumMap, json['widthBasis'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$DefaultTextStyleArgumentsToJson(
        DefaultTextStyleArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'overflow': _$TextOverflowEnumMap[instance.overflow],
      'maxLines': instance.maxLines,
      'softWrap': instance.softWrap,
      'align': _$TextAlignEnumMap[instance.align],
      'size': instance.size,
      'color': colorToJson(instance.color),
      'widthBasis': _$TextWidthBasisEnumMap[instance.widthBasis],
    };

const _$TextOverflowEnumMap = {
  TextOverflow.clip: 'clip',
  TextOverflow.fade: 'fade',
  TextOverflow.ellipsis: 'ellipsis',
  TextOverflow.visible: 'visible',
};

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};

const _$TextWidthBasisEnumMap = {
  TextWidthBasis.parent: 'parent',
  TextWidthBasis.longestLine: 'longestLine',
};
