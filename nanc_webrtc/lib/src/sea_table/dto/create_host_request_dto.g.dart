// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_host_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateHostRequestDto _$CreateHostRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreateHostRequestDto(
      tableName: json['table_name'] as String,
      row: HostDto.fromJson(json['row']),
    );

Map<String, dynamic> _$CreateHostRequestDtoToJson(
        CreateHostRequestDto instance) =>
    <String, dynamic>{
      'table_name': instance.tableName,
      'row': instance.row.toJson(),
    };
