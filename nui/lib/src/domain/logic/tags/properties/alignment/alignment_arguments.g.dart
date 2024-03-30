// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alignment_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlignmentArguments _$AlignmentArgumentsFromJson(Map<String, dynamic> json) =>
    AlignmentArguments(
      x: nullableDoubleFromJson(json['x']),
      y: nullableDoubleFromJson(json['y']),
      align: $enumDecodeNullable(_$AlignmentEnumEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$AlignmentArgumentsToJson(AlignmentArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'x': instance.x,
      'y': instance.y,
      'align': _$AlignmentEnumEnumMap[instance.align],
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
