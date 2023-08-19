// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rich_text_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RichTextArguments _$RichTextArgumentsFromJson(Map<String, dynamic> json) =>
    RichTextArguments(
      textDirection: $enumDecodeNullable(
          _$TextDirectionEnumMap, json['textDirection'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      overflow: $enumDecodeNullable(_$TextOverflowEnumMap, json['overflow'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      maxLines: nullableIntFromJson(json['maxLines']),
      selectionColor: nullableColorFromJson(json['selectionColor'] as String?),
      softWrap: nullableBoolFromJson(json['softWrap']),
      align: $enumDecodeNullable(_$TextAlignEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      scaleFactor: nullableDoubleFromJson(json['scaleFactor']),
      widthBasis: $enumDecodeNullable(
          _$TextWidthBasisEnumMap, json['widthBasis'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      color: nullableColorFromJson(json['color'] as String?),
      size: nullableDoubleFromJson(json['size']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$RichTextArgumentsToJson(RichTextArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'textDirection': _$TextDirectionEnumMap[instance.textDirection],
      'overflow': _$TextOverflowEnumMap[instance.overflow],
      'maxLines': instance.maxLines,
      'selectionColor': colorToJson(instance.selectionColor),
      'softWrap': instance.softWrap,
      'align': _$TextAlignEnumMap[instance.align],
      'scaleFactor': instance.scaleFactor,
      'size': instance.size,
      'color': colorToJson(instance.color),
      'widthBasis': _$TextWidthBasisEnumMap[instance.widthBasis],
    };

const _$TextDirectionEnumMap = {
  TextDirection.rtl: 'rtl',
  TextDirection.ltr: 'ltr',
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
