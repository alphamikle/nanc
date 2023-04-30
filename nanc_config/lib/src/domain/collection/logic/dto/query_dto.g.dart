// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryDto _$QueryDtoFromJson(Map<String, dynamic> json) => QueryDto(
      singleValues: (json['singleValues'] as List<dynamic>?)
              ?.map((e) => QuerySingleParameter.fromJson(e))
              .toList() ??
          const [],
      multipleValues: (json['multipleValues'] as List<dynamic>?)
              ?.map((e) => QueryMultipleParameter.fromJson(e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QueryDtoToJson(QueryDto instance) => <String, dynamic>{
      'singleValues': instance.singleValues,
      'multipleValues': instance.multipleValues,
    };
