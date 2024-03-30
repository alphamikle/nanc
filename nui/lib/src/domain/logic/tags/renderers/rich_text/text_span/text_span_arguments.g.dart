// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_span_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextSpanArguments _$TextSpanArgumentsFromJson(Map<String, dynamic> json) =>
    TextSpanArguments(
      text: json['text'] as String?,
      cursor: $enumDecodeNullable(_$MouseCursorEnumEnumMap, json['cursor'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      onEnter: json['onEnter'] as String?,
      onExit: json['onExit'] as String?,
      onPressed: json['onPressed'] as String?,
      color: nullableColorFromJson(json['color'] as String?),
      size: nullableDoubleFromJson(json['size']),
      spellOut: nullableBoolFromJson(json['spellOut']),
      separator: json['separator'] as String?,
      skipEmptyLines: nullableBoolFromJson(json['skipEmptyLines']),
    );

Map<String, dynamic> _$TextSpanArgumentsToJson(TextSpanArguments instance) =>
    <String, dynamic>{
      'text': instance.text,
      'cursor': _$MouseCursorEnumEnumMap[instance.cursor],
      'onEnter': instance.onEnter,
      'onExit': instance.onExit,
      'onPressed': instance.onPressed,
      'color': colorToJson(instance.color),
      'size': instance.size,
      'spellOut': instance.spellOut,
      'separator': instance.separator,
      'skipEmptyLines': instance.skipEmptyLines,
    };

const _$MouseCursorEnumEnumMap = {
  MouseCursorEnum.none: 'none',
  MouseCursorEnum.basic: 'basic',
  MouseCursorEnum.click: 'click',
  MouseCursorEnum.forbidden: 'forbidden',
  MouseCursorEnum.wait: 'wait',
  MouseCursorEnum.progress: 'progress',
  MouseCursorEnum.contextMenu: 'contextMenu',
  MouseCursorEnum.help: 'help',
  MouseCursorEnum.text: 'text',
  MouseCursorEnum.verticalText: 'verticalText',
  MouseCursorEnum.cell: 'cell',
  MouseCursorEnum.precise: 'precise',
  MouseCursorEnum.move: 'move',
  MouseCursorEnum.grab: 'grab',
  MouseCursorEnum.grabbing: 'grabbing',
  MouseCursorEnum.noDrop: 'noDrop',
  MouseCursorEnum.alias: 'alias',
  MouseCursorEnum.copy: 'copy',
  MouseCursorEnum.disappearing: 'disappearing',
  MouseCursorEnum.allScroll: 'allScroll',
  MouseCursorEnum.zoomIn: 'zoomIn',
  MouseCursorEnum.zoomOut: 'zoomOut',
};
