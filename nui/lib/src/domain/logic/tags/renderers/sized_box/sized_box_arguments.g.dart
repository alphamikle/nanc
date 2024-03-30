// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sized_box_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizedBoxArguments _$SizedBoxArgumentsFromJson(Map<String, dynamic> json) =>
    SizedBoxArguments(
      height: nullableDoubleFromJson(json['height']),
      width: nullableDoubleFromJson(json['width']),
      size: nullableDoubleFromJson(json['size']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$SizedBoxArgumentsToJson(SizedBoxArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'height': instance.height,
      'width': instance.width,
      'size': instance.size,
    };
