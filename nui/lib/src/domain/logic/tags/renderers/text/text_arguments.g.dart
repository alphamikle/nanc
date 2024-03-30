// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextArguments _$TextArgumentsFromJson(Map<String, dynamic> json) =>
    TextArguments(
      text: json['text'] as String?,
      direction: $enumDecodeNullable(_$TextDirectionEnumMap, json['direction'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      maxLines: nullableIntFromJson(json['maxLines']),
      align: $enumDecodeNullable(_$TextAlignEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      overflow: $enumDecodeNullable(_$TextOverflowEnumMap, json['overflow'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      softWrap: nullableBoolFromJson(json['softWrap']),
      size: nullableDoubleFromJson(json['size']),
      color: nullableColorFromJson(json['color'] as String?),
      separator: json['separator'] as String?,
      skipEmptyLines: nullableBoolFromJson(json['skipEmptyLines']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$TextArgumentsToJson(TextArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'text': instance.text,
      'direction': _$TextDirectionEnumMap[instance.direction],
      'maxLines': instance.maxLines,
      'align': _$TextAlignEnumMap[instance.align],
      'overflow': _$TextOverflowEnumMap[instance.overflow],
      'size': instance.size,
      'color': colorToJson(instance.color),
      'softWrap': instance.softWrap,
      'separator': instance.separator,
      'skipEmptyLines': instance.skipEmptyLines,
    };

const _$TextDirectionEnumMap = {
  TextDirection.rtl: 'rtl',
  TextDirection.ltr: 'ltr',
};

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};

const _$TextOverflowEnumMap = {
  TextOverflow.clip: 'clip',
  TextOverflow.fade: 'fade',
  TextOverflow.ellipsis: 'ellipsis',
  TextOverflow.visible: 'visible',
};
