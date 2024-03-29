// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuerySingleParameter _$QuerySingleParameterFromJson(
        Map<String, dynamic> json) =>
    QuerySingleParameter(
      name: json['name'] as String,
      value: _fromJson(json['value']),
    );

Map<String, dynamic> _$QuerySingleParameterToJson(
        QuerySingleParameter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

QueryMultipleParameter _$QueryMultipleParameterFromJson(
        Map<String, dynamic> json) =>
    QueryMultipleParameter(
      name: json['name'] as String,
      values: _fromJsonList(json['values']),
    );

Map<String, dynamic> _$QueryMultipleParameterToJson(
        QueryMultipleParameter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };
