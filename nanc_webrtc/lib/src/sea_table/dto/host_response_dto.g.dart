// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostResponseDto _$HostResponseDtoFromJson(Map<String, dynamic> json) =>
    HostResponseDto(
      success: json['success'] as bool,
      results: (json['results'] as List<dynamic>)
          .map((e) => HostDto.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$HostResponseDtoToJson(HostResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
