// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aspect_ratio_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AspectRatioArguments _$AspectRatioArgumentsFromJson(
        Map<String, dynamic> json) =>
    AspectRatioArguments(
      ratio: nullableDoubleFromJson(json['ratio']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$AspectRatioArgumentsToJson(
        AspectRatioArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'ratio': instance.ratio,
    };
