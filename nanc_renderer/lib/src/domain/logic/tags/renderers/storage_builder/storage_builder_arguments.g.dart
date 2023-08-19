// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_builder_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageBuilderArguments _$StorageBuilderArgumentsFromJson(
        Map<String, dynamic> json) =>
    StorageBuilderArguments(
      buildAlways: nullableBoolFromJson(json['buildAlways']),
      buildWhen: json['buildWhen'] as String?,
      orWhen: json['orWhen'] as String?,
      andWhen: json['andWhen'] as String?,
      onUpdate: json['onUpdate'] as String?,
    );

Map<String, dynamic> _$StorageBuilderArgumentsToJson(
        StorageBuilderArguments instance) =>
    <String, dynamic>{
      'buildAlways': instance.buildAlways,
      'buildWhen': instance.buildWhen,
      'orWhen': instance.orWhen,
      'andWhen': instance.andWhen,
      'onUpdate': instance.onUpdate,
    };
