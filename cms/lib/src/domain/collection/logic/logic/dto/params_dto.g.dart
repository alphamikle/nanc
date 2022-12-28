// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamsDto _$ParamsDtoFromJson(Map<String, dynamic> json) => ParamsDto(
      page: json['page'] as int,
      limit: json['limit'] as int,
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParamsDtoToJson(ParamsDto instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'sort': instance.sort.toJson(),
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      field: json['field'] as String,
      order: $enumDecode(_$OrderEnumMap, json['order']),
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'field': instance.field,
      'order': _$OrderEnumMap[instance.order]!,
    };

const _$OrderEnumMap = {
  Order.asc: 'asc',
  Order.desc: 'desc',
};
