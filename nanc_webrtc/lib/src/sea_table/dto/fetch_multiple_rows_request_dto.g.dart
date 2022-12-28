// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_multiple_rows_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchMultipleRowsRequestDto _$FetchMultipleRowsRequestDtoFromJson(
        Map<String, dynamic> json) =>
    FetchMultipleRowsRequestDto(
      sql: json['sql'] as String,
      convertKeys: json['convert_keys'] as bool? ?? true,
    );

Map<String, dynamic> _$FetchMultipleRowsRequestDtoToJson(
        FetchMultipleRowsRequestDto instance) =>
    <String, dynamic>{
      'sql': instance.sql,
      'convert_keys': instance.convertKeys,
    };
