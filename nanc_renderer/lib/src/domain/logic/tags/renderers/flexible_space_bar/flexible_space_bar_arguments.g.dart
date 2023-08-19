// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flexible_space_bar_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlexibleSpaceBarArguments _$FlexibleSpaceBarArgumentsFromJson(
        Map<String, dynamic> json) =>
    FlexibleSpaceBarArguments(
      centerTitle: nullableBoolFromJson(json['centerTitle']),
      collapseMode: $enumDecodeNullable(
          _$CollapseModeEnumMap, json['collapseMode'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      expandedTitleScale: nullableDoubleFromJson(json['expandedTitleScale']),
      blurBackground: nullableBoolFromJson(json['blurBackground']),
      fadeTitle: nullableBoolFromJson(json['fadeTitle']),
      zoomBackground: nullableBoolFromJson(json['zoomBackground']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$FlexibleSpaceBarArgumentsToJson(
        FlexibleSpaceBarArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'centerTitle': instance.centerTitle,
      'collapseMode': _$CollapseModeEnumMap[instance.collapseMode],
      'expandedTitleScale': instance.expandedTitleScale,
      'blurBackground': instance.blurBackground,
      'fadeTitle': instance.fadeTitle,
      'zoomBackground': instance.zoomBackground,
    };

const _$CollapseModeEnumMap = {
  CollapseMode.parallax: 'parallax',
  CollapseMode.pin: 'pin',
  CollapseMode.none: 'none',
};
