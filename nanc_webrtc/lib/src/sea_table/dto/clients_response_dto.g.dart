// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsResponseDto _$ClientsResponseDtoFromJson(Map<String, dynamic> json) =>
    ClientsResponseDto(
      success: json['success'] as bool,
      results: (json['results'] as List<dynamic>)
          .map((e) => ClientDto.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$ClientsResponseDtoToJson(ClientsResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
