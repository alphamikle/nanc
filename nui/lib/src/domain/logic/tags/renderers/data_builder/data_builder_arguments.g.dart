// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_builder_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBuilderArguments _$DataBuilderArgumentsFromJson(
        Map<String, dynamic> json) =>
    DataBuilderArguments(
      buildAlways: nullableBoolFromJson(json['buildAlways']),
      buildWhen: json['buildWhen'] as String?,
      orWhen: json['orWhen'] as String?,
      andWhen: json['andWhen'] as String?,
      onUpdate: json['onUpdate'] as String?,
    );

Map<String, dynamic> _$DataBuilderArgumentsToJson(
        DataBuilderArguments instance) =>
    <String, dynamic>{
      'buildAlways': instance.buildAlways,
      'buildWhen': instance.buildWhen,
      'orWhen': instance.orWhen,
      'andWhen': instance.andWhen,
      'onUpdate': instance.onUpdate,
    };
