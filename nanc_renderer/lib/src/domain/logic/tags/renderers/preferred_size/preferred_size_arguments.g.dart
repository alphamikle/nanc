// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferred_size_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferredSizeArguments _$PreferredSizeArgumentsFromJson(
        Map<String, dynamic> json) =>
    PreferredSizeArguments(
      height: nullableDoubleFromJson(json['height']),
      width: nullableDoubleFromJson(json['width']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$PreferredSizeArgumentsToJson(
        PreferredSizeArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'height': instance.height,
      'width': instance.width,
    };
