// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwitchArguments _$SwitchArgumentsFromJson(Map<String, dynamic> json) =>
    SwitchArguments(
      value: nullableBoolFromJson(json['value']),
      style: $enumDecodeNullable(_$StyleEnumMap, json['style'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      onChanged: json['onChanged'] as String?,
      cursor: $enumDecodeNullable(_$MouseCursorEnumEnumMap, json['cursor'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      activeColor: nullableColorFromJson(json['activeColor'] as String?),
      activeTrackColor:
          nullableColorFromJson(json['activeTrackColor'] as String?),
      focusColor: nullableColorFromJson(json['focusColor'] as String?),
      hoverColor: nullableColorFromJson(json['hoverColor'] as String?),
      inactiveThumbColor:
          nullableColorFromJson(json['inactiveThumbColor'] as String?),
      inactiveTrackColor:
          nullableColorFromJson(json['inactiveTrackColor'] as String?),
      overlayColor: nullableColorFromJson(json['overlayColor'] as String?),
      thumbColor: nullableColorFromJson(json['thumbColor'] as String?),
      trackColor: nullableColorFromJson(json['trackColor'] as String?),
      trackOutlineColor:
          nullableColorFromJson(json['trackOutlineColor'] as String?),
      trackOutlineWidth: nullableDoubleFromJson(json['trackOutlineWidth']),
      splashRadius: nullableDoubleFromJson(json['splashRadius']),
    );

Map<String, dynamic> _$SwitchArgumentsToJson(SwitchArguments instance) =>
    <String, dynamic>{
      'value': instance.value,
      'style': _$StyleEnumMap[instance.style],
      'onChanged': instance.onChanged,
      'cursor': _$MouseCursorEnumEnumMap[instance.cursor],
      'activeColor': colorToJson(instance.activeColor),
      'activeTrackColor': colorToJson(instance.activeTrackColor),
      'focusColor': colorToJson(instance.focusColor),
      'hoverColor': colorToJson(instance.hoverColor),
      'inactiveThumbColor': colorToJson(instance.inactiveThumbColor),
      'inactiveTrackColor': colorToJson(instance.inactiveTrackColor),
      'overlayColor': colorToJson(instance.overlayColor),
      'thumbColor': colorToJson(instance.thumbColor),
      'trackColor': colorToJson(instance.trackColor),
      'trackOutlineColor': colorToJson(instance.trackOutlineColor),
      'trackOutlineWidth': instance.trackOutlineWidth,
      'splashRadius': instance.splashRadius,
    };

const _$StyleEnumMap = {
  Style.material: 'material',
  Style.hig: 'hig',
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
