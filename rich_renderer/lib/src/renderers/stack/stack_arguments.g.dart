// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StackArguments _$StackArgumentsFromJson(Map<String, dynamic> json) =>
    StackArguments(
      fit: $enumDecodeNullable(_$StackFitEnumMap, json['fit'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      x: stringToDoubleOrNull(json['x'] as String?),
      y: stringToDoubleOrNull(json['y'] as String?),
      align: $enumDecodeNullable(_$AlignmentEnumEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$StackArgumentsToJson(StackArguments instance) =>
    <String, dynamic>{
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
