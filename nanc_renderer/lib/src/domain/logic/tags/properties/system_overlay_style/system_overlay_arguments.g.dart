// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_overlay_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemOverlayArguments _$SystemOverlayArgumentsFromJson(
        Map<String, dynamic> json) =>
    SystemOverlayArguments(
      statusBarBrightness:
          $enumDecodeNullable(_$BrightnessEnumMap, json['statusBarBrightness']),
      statusBarColor: nullableColorFromJson(json['statusBarColor'] as String?),
      statusBarIconBrightness: $enumDecodeNullable(
          _$BrightnessEnumMap, json['statusBarIconBrightness'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      systemNavigationBarColor:
          nullableColorFromJson(json['systemNavigationBarColor'] as String?),
      systemNavigationBarContrastEnforced:
          nullableBoolFromJson(json['systemNavigationBarContrastEnforced']),
      systemNavigationBarDividerColor: nullableColorFromJson(
          json['systemNavigationBarDividerColor'] as String?),
      systemNavigationBarIconBrightness: $enumDecodeNullable(
          _$BrightnessEnumMap, json['systemNavigationBarIconBrightness'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      systemStatusBarContrastEnforced:
          nullableBoolFromJson(json['systemStatusBarContrastEnforced']),
    );

Map<String, dynamic> _$SystemOverlayArgumentsToJson(
        SystemOverlayArguments instance) =>
    <String, dynamic>{
      'statusBarBrightness': _$BrightnessEnumMap[instance.statusBarBrightness],
      'statusBarColor': colorToJson(instance.statusBarColor),
      'statusBarIconBrightness':
          _$BrightnessEnumMap[instance.statusBarIconBrightness],
      'systemNavigationBarColor':
          colorToJson(instance.systemNavigationBarColor),
      'systemNavigationBarContrastEnforced':
          instance.systemNavigationBarContrastEnforced,
      'systemNavigationBarDividerColor':
          colorToJson(instance.systemNavigationBarDividerColor),
      'systemNavigationBarIconBrightness':
          _$BrightnessEnumMap[instance.systemNavigationBarIconBrightness],
      'systemStatusBarContrastEnforced':
          instance.systemStatusBarContrastEnforced,
    };

const _$BrightnessEnumMap = {
  Brightness.dark: 'dark',
  Brightness.light: 'light',
};
