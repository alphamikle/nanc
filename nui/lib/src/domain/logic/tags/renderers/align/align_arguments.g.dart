// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'align_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlignArguments _$AlignArgumentsFromJson(Map<String, dynamic> json) =>
    AlignArguments(
      x: nullableDoubleFromJson(json['x']),
      y: nullableDoubleFromJson(json['y']),
      align: $enumDecodeNullable(_$AlignmentEnumEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      heightFactor: nullableDoubleFromJson(json['heightFactor']),
      widthFactor: nullableDoubleFromJson(json['widthFactor']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$AlignArgumentsToJson(AlignArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'x': instance.x,
      'y': instance.y,
      'align': _$AlignmentEnumEnumMap[instance.align],
      'heightFactor': instance.heightFactor,
      'widthFactor': instance.widthFactor,
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
