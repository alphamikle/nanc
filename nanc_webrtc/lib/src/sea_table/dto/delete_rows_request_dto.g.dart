// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_rows_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRowsRequestDto _$DeleteRowsRequestDtoFromJson(
        Map<String, dynamic> json) =>
    DeleteRowsRequestDto(
      tableName: json['table_name'] as String,
      rowIds:
          (json['row_ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DeleteRowsRequestDtoToJson(
        DeleteRowsRequestDto instance) =>
    <String, dynamic>{
      'table_name': instance.tableName,
      'row_ids': instance.rowIds,
    };
