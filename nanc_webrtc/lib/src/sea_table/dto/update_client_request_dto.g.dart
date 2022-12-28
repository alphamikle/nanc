// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_client_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateClientRequestDto _$UpdateClientRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateClientRequestDto(
      rowId: json['row_id'] as String,
      tableName: json['table_name'] as String,
      row: ClientDto.fromJson(json['row']),
    );

Map<String, dynamic> _$UpdateClientRequestDtoToJson(
        UpdateClientRequestDto instance) =>
    <String, dynamic>{
      'row_id': instance.rowId,
      'table_name': instance.tableName,
      'row': instance.row.toJson(),
    };
