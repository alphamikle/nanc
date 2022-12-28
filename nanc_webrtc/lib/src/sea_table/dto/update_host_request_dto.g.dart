// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_host_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateHostRequestDto _$UpdateHostRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateHostRequestDto(
      rowId: json['row_id'] as String,
      tableName: json['table_name'] as String,
      row: HostDto.fromJson(json['row']),
    );

Map<String, dynamic> _$UpdateHostRequestDtoToJson(
        UpdateHostRequestDto instance) =>
    <String, dynamic>{
      'row_id': instance.rowId,
      'table_name': instance.tableName,
      'row': instance.row.toJson(),
    };
