// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tooltip_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TooltipArguments _$TooltipArgumentsFromJson(Map<String, dynamic> json) =>
    TooltipArguments(
      height: nullableDoubleFromJson(json['height']),
      align: $enumDecodeNullable(_$TextAlignEnumMap, json['align']),
      text: json['text'] as String?,
      below: boolFromJson(json['below']),
      offset: nullableDoubleFromJson(json['offset']),
      showDuration: nullableIntFromJson(json['showDuration']),
      waitDuration: nullableIntFromJson(json['waitDuration']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$TooltipArgumentsToJson(TooltipArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'height': instance.height,
      'align': _$TextAlignEnumMap[instance.align],
      'text': instance.text,
      'below': instance.below,
      'offset': instance.offset,
      'showDuration': instance.showDuration,
      'waitDuration': instance.waitDuration,
    };

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};
