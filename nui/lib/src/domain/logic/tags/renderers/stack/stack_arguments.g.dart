// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StackArguments _$StackArgumentsFromJson(Map<String, dynamic> json) =>
    StackArguments(
      fit: $enumDecodeNullable(_$StackFitEnumMap, json['fit'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      x: nullableDoubleFromJson(json['x']),
      y: nullableDoubleFromJson(json['y']),
      align: $enumDecodeNullable(_$AlignmentEnumEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$StackArgumentsToJson(StackArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'x': instance.x,
      'y': instance.y,
      'align': _$AlignmentEnumEnumMap[instance.align],
      'fit': _$StackFitEnumMap[instance.fit],
    };

const _$StackFitEnumMap = {
  StackFit.loose: 'loose',
  StackFit.expand: 'expand',
  StackFit.passthrough: 'passthrough',
};

const _$AlignmentEnumEnumMap = {
  AlignmentEnum.topLeft: 'topLeft',
  AlignmentEnum.topCenter: 'topCenter',
  AlignmentEnum.topRight: 'topRight',
  AlignmentEnum.centerLeft: 'centerLeft',
  AlignmentEnum.center: 'center',
  AlignmentEnum.centerRight: 'centerRight',
  AlignmentEnum.bottomLeft: 'bottomLeft',
  AlignmentEnum.bottomCenter: 'bottomCenter',
  AlignmentEnum.bottomRight: 'bottomRight',
};
