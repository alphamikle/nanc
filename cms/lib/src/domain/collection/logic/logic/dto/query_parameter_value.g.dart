// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_parameter_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryStringValue _$QueryStringValueFromJson(Map<String, dynamic> json) =>
    QueryStringValue(
      json['value'] as String,
    );

Map<String, dynamic> _$QueryStringValueToJson(QueryStringValue instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

QueryNumberValue _$QueryNumberValueFromJson(Map<String, dynamic> json) =>
    QueryNumberValue(
      json['value'] as num,
    );

Map<String, dynamic> _$QueryNumberValueToJson(QueryNumberValue instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

QueryBooleanValue _$QueryBooleanValueFromJson(Map<String, dynamic> json) =>
    QueryBooleanValue(
      json['value'] as bool,
    );

Map<String, dynamic> _$QueryBooleanValueToJson(QueryBooleanValue instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
