// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_scroll_view_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomScrollViewArguments _$CustomScrollViewArgumentsFromJson(
        Map<String, dynamic> json) =>
    CustomScrollViewArguments(
      physics: $enumDecodeNullable(_$ScrollPhysicsEnumEnumMap, json['physics'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      axis: $enumDecodeNullable(_$AxisEnumMap, json['axis'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      cacheExtent: nullableDoubleFromJson(json['cacheExtent']),
      reverse: json['reverse'] as bool? ?? false,
      shrinkWrap: json['shrinkWrap'] as bool? ?? false,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$CustomScrollViewArgumentsToJson(
        CustomScrollViewArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'physics': _$ScrollPhysicsEnumEnumMap[instance.physics],
      'axis': _$AxisEnumMap[instance.axis],
      'cacheExtent': instance.cacheExtent,
      'reverse': instance.reverse,
      'shrinkWrap': instance.shrinkWrap,
    };

const _$ScrollPhysicsEnumEnumMap = {
  ScrollPhysicsEnum.always: 'always',
  ScrollPhysicsEnum.bouncing: 'bouncing',
  ScrollPhysicsEnum.clamping: 'clamping',
  ScrollPhysicsEnum.fixedExtent: 'fixedExtent',
  ScrollPhysicsEnum.never: 'never',
  ScrollPhysicsEnum.page: 'page',
  ScrollPhysicsEnum.range: 'range',
};

const _$AxisEnumMap = {
  Axis.horizontal: 'horizontal',
  Axis.vertical: 'vertical',
};
