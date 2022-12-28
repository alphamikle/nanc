// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_client_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateClientRequestDto _$CreateClientRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreateClientRequestDto(
      tableName: json['table_name'] as String,
      row: ClientDto.fromJson(json['row']),
    );

Map<String, dynamic> _$CreateClientRequestDtoToJson(
        CreateClientRequestDto instance) =>
    <String, dynamic>{
      'table_name': instance.tableName,
      'row': instance.row.toJson(),
    };
