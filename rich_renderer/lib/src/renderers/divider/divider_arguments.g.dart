// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divider_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DividerArguments _$DividerArgumentsFromJson(Map<String, dynamic> json) =>
    DividerArguments(
      height: stringToDoubleOrNull(json['height'] as String?),
      width: stringToDoubleOrNull(json['width'] as String?),
    );

Map<String, dynamic> _$DividerArgumentsToJson(DividerArguments instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
    };
