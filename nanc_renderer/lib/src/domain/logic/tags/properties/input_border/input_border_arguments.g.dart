// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_border_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputBorderArguments _$InputBorderArgumentsFromJson(
        Map<String, dynamic> json) =>
    InputBorderArguments(
      type: $enumDecodeNullable(_$InputBorderTypeEnumMap, json['type'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      gap: nullableDoubleFromJson(json['gap']),
    );

Map<String, dynamic> _$InputBorderArgumentsToJson(
        InputBorderArguments instance) =>
    <String, dynamic>{
      'type': _$InputBorderTypeEnumMap[instance.type],
      'gap': instance.gap,
    };

const _$InputBorderTypeEnumMap = {
  InputBorderType.outline: 'outline',
  InputBorderType.underline: 'underline',
  InputBorderType.none: 'none',
};
