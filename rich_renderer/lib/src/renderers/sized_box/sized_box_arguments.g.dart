// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sized_box_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizedBoxArguments _$SizedBoxArgumentsFromJson(Map<String, dynamic> json) =>
    SizedBoxArguments(
      height: doubleOrNullFromJson(json['height'] as String?),
      width: doubleOrNullFromJson(json['width'] as String?),
      size: doubleOrNullFromJson(json['size'] as String?),
    );

Map<String, dynamic> _$SizedBoxArgumentsToJson(SizedBoxArguments instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'size': instance.size,
    };
