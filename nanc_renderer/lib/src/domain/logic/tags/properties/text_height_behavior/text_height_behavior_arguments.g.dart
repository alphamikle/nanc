// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_height_behavior_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextHeightBehaviorArguments _$TextHeightBehaviorArgumentsFromJson(
        Map<String, dynamic> json) =>
    TextHeightBehaviorArguments(
      firstAscent: nullableBoolFromJson(json['firstAscent']),
      lastDescent: nullableBoolFromJson(json['lastDescent']),
      leadingDistribution: $enumDecodeNullable(
          _$TextLeadingDistributionEnumMap, json['leadingDistribution'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$TextHeightBehaviorArgumentsToJson(
        TextHeightBehaviorArguments instance) =>
    <String, dynamic>{
      'firstAscent': instance.firstAscent,
      'lastDescent': instance.lastDescent,
      'leadingDistribution':
          _$TextLeadingDistributionEnumMap[instance.leadingDistribution],
    };

const _$TextLeadingDistributionEnumMap = {
  TextLeadingDistribution.proportional: 'proportional',
  TextLeadingDistribution.even: 'even',
};
