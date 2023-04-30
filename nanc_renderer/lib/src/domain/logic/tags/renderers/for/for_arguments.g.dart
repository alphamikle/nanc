// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'for_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForArguments _$ForArgumentsFromJson(Map<String, dynamic> json) => ForArguments(
      valueName: json['valueName'] as String?,
      indexName: json['indexName'] as String?,
      values: json['in'] as String?,
      oldValues: json['in_old'] as String?,
      from: nullableIntFromJson(json['from']),
      to: nullableIntFromJson(json['to']),
    );

Map<String, dynamic> _$ForArgumentsToJson(ForArguments instance) =>
    <String, dynamic>{
      'valueName': instance.valueName,
      'indexName': instance.indexName,
      'in': instance.values,
      'in_old': instance.oldValues,
      'from': instance.from,
      'to': instance.to,
    };
