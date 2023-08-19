// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_wheel_scroll_view_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListWheelScrollViewArguments _$ListWheelScrollViewArgumentsFromJson(
        Map<String, dynamic> json) =>
    ListWheelScrollViewArguments(
      axis: $enumDecodeNullable(_$AxisEnumMap, json['axis'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      itemExtent: nullableDoubleFromJson(json['itemExtent']),
      diameterRatio: nullableDoubleFromJson(json['diameterRatio']),
      magnification: nullableDoubleFromJson(json['magnification']),
      offAxisFraction: nullableDoubleFromJson(json['offAxisFraction']),
      onSelectedItemChanged: json['onSelectedItemChanged'] as String?,
      overAndUnderCenterOpacity:
          nullableDoubleFromJson(json['overAndUnderCenterOpacity']),
      perspective: nullableDoubleFromJson(json['perspective']),
      renderChildrenOutsideViewport:
          nullableBoolFromJson(json['renderChildrenOutsideViewport']),
      squeeze: nullableDoubleFromJson(json['squeeze']),
      useMagnifier: nullableBoolFromJson(json['useMagnifier']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$ListWheelScrollViewArgumentsToJson(
        ListWheelScrollViewArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'axis': _$AxisEnumMap[instance.axis],
      'itemExtent': instance.itemExtent,
      'diameterRatio': instance.diameterRatio,
      'magnification': instance.magnification,
      'offAxisFraction': instance.offAxisFraction,
      'onSelectedItemChanged': instance.onSelectedItemChanged,
      'overAndUnderCenterOpacity': instance.overAndUnderCenterOpacity,
      'perspective': instance.perspective,
      'renderChildrenOutsideViewport': instance.renderChildrenOutsideViewport,
      'squeeze': instance.squeeze,
      'useMagnifier': instance.useMagnifier,
    };

const _$AxisEnumMap = {
  Axis.horizontal: 'horizontal',
  Axis.vertical: 'vertical',
};
