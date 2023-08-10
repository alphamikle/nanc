// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_area_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafeAreaArguments _$SafeAreaArgumentsFromJson(Map<String, dynamic> json) =>
    SafeAreaArguments(
      left: nullableBoolFromJson(json['left']),
      top: nullableBoolFromJson(json['top']),
      right: nullableBoolFromJson(json['right']),
      bottom: nullableBoolFromJson(json['bottom']),
      bottomViewPadding: nullableBoolFromJson(json['bottomViewPadding']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$SafeAreaArgumentsToJson(SafeAreaArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'bottomViewPadding': instance.bottomViewPadding,
    };
