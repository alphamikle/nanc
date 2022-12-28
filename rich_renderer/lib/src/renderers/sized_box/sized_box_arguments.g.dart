// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sized_box_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizedBoxArguments _$SizedBoxArgumentsFromJson(Map<String, dynamic> json) =>
    SizedBoxArguments(
      height: stringToDoubleOrNull(json['height'] as String?),
      width: stringToDoubleOrNull(json['width'] as String?),
      all: stringToDoubleOrNull(json['all'] as String?),
    );

Map<String, dynamic> _$SizedBoxArgumentsToJson(SizedBoxArguments instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'all': instance.all,
    };
