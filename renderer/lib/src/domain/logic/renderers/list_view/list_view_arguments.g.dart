// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_view_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListViewArguments _$ListViewArgumentsFromJson(Map<String, dynamic> json) =>
    ListViewArguments(
      physics: $enumDecodeNullable(_$ScrollPhysicsEnumEnumMap, json['physics'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      axis: $enumDecodeNullable(_$AxisEnumMap, json['axis'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      cacheExtent: nullableDoubleFromJson(json['cacheExtent'] as String?),
      itemExtent: nullableDoubleFromJson(json['itemExtent'] as String?),
      reverse: json['reverse'] as bool? ?? false,
      shrinkWrap: json['shrinkWrap'] as bool? ?? false,
    );

Map<String, dynamic> _$ListViewArgumentsToJson(ListViewArguments instance) =>
    <String, dynamic>{
      'physics': _$ScrollPhysicsEnumEnumMap[instance.physics],
      'axis': _$AxisEnumMap[instance.axis],
      'cacheExtent': instance.cacheExtent,
      'itemExtent': instance.itemExtent,
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
