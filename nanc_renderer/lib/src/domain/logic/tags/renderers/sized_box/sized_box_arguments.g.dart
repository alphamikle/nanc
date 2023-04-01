// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sized_box_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizedBoxArguments _$SizedBoxArgumentsFromJson(Map<String, dynamic> json) =>
    SizedBoxArguments(
      height: nullableDoubleFromJson(json['height'] as String?),
      width: nullableDoubleFromJson(json['width'] as String?),
      size: nullableDoubleFromJson(json['size'] as String?),
    );

Map<String, dynamic> _$SizedBoxArgumentsToJson(SizedBoxArguments instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'size': instance.size,
    };
