// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalField _$ExternalFieldFromJson(Map<String, dynamic> json) =>
    ExternalField(
      type: $enumDecodeNullable(_$TitleFieldTypeEnumMap, json['type']),
      id: json['id'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ExternalFieldToJson(ExternalField instance) =>
    <String, dynamic>{
      'type': _$TitleFieldTypeEnumMap[instance.type],
      'id': instance.id,
      'value': instance.value,
    };

const _$TitleFieldTypeEnumMap = {
  TitleFieldType.externalField: 'externalField',
  TitleFieldType.fieldsDivider: 'fieldsDivider',
  TitleFieldType.fieldsDecorator: 'fieldsDecorator',
};

FieldsDivider _$FieldsDividerFromJson(Map<String, dynamic> json) =>
    FieldsDivider(
      type: $enumDecodeNullable(_$TitleFieldTypeEnumMap, json['type']),
      divider: json['divider'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$FieldsDividerToJson(FieldsDivider instance) =>
    <String, dynamic>{
      'type': _$TitleFieldTypeEnumMap[instance.type],
      'divider': instance.divider,
      'value': instance.value,
    };

FieldsDecorator _$FieldsDecoratorFromJson(Map<String, dynamic> json) =>
    FieldsDecorator(
      type: $enumDecodeNullable(_$TitleFieldTypeEnumMap, json['type']),
      decorator: json['decorator'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$FieldsDecoratorToJson(FieldsDecorator instance) =>
    <String, dynamic>{
      'type': _$TitleFieldTypeEnumMap[instance.type],
      'decorator': instance.decorator,
      'value': instance.value,
    };
