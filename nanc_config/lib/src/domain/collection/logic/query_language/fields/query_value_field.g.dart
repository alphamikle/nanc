// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_value_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$QueryValueFieldAutoequal on QueryValueField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [fieldId, value, type];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QueryValueFieldCWProxy {
  QueryValueField fieldId(String fieldId);

  QueryValueField value(dynamic value);

  QueryValueField type(QueryFieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryValueField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryValueField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryValueField call({
    String? fieldId,
    dynamic value,
    QueryFieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueryValueField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueryValueField.copyWith.fieldName(...)`
class _$QueryValueFieldCWProxyImpl implements _$QueryValueFieldCWProxy {
  const _$QueryValueFieldCWProxyImpl(this._value);

  final QueryValueField _value;

  @override
  QueryValueField fieldId(String fieldId) => this(fieldId: fieldId);

  @override
  QueryValueField value(dynamic value) => this(value: value);

  @override
  QueryValueField type(QueryFieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryValueField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryValueField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryValueField call({
    Object? fieldId = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return QueryValueField(
      fieldId: fieldId == const $CopyWithPlaceholder() || fieldId == null
          ? _value.fieldId
          // ignore: cast_nullable_to_non_nullable
          : fieldId as String,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as dynamic,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as QueryFieldType,
    );
  }
}

extension $QueryValueFieldCopyWith on QueryValueField {
  /// Returns a callable class that can be used as follows: `instanceOfQueryValueField.copyWith(...)` or like so:`instanceOfQueryValueField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueryValueFieldCWProxy get copyWith => _$QueryValueFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryValueField _$QueryValueFieldFromJson(Map<String, dynamic> json) =>
    QueryValueField(
      fieldId: json['field_id'] as String? ?? '',
      value: json['value'] ?? '',
      type: $enumDecodeNullable(_$QueryFieldTypeEnumMap, json['type'],
              unknownValue: QueryFieldType.unknown) ??
          QueryFieldType.unknown,
    );

Map<String, dynamic> _$QueryValueFieldToJson(QueryValueField instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'value': instance.value,
      'type': _$QueryFieldTypeEnumMap[instance.type]!,
    };

const _$QueryFieldTypeEnumMap = {
  QueryFieldType.or: 'or',
  QueryFieldType.and: 'and',
  QueryFieldType.equals: 'equals',
  QueryFieldType.notEquals: 'notEquals',
  QueryFieldType.startsWith: 'startsWith',
  QueryFieldType.notStartsWith: 'notStartsWith',
  QueryFieldType.endsWith: 'endsWith',
  QueryFieldType.notEndsWith: 'notEndsWith',
  QueryFieldType.contains: 'contains',
  QueryFieldType.notContains: 'notContains',
  QueryFieldType.empty: 'empty',
  QueryFieldType.notEmpty: 'notEmpty',
  QueryFieldType.less: 'less',
  QueryFieldType.lessOrEquals: 'lessOrEquals',
  QueryFieldType.greater: 'greater',
  QueryFieldType.greaterOrEquals: 'greaterOrEquals',
  QueryFieldType.isTrue: 'isTrue',
  QueryFieldType.isFalse: 'isFalse',
  QueryFieldType.isNull: 'isNull',
  QueryFieldType.isNotNull: 'isNotNull',
  QueryFieldType.unknown: 'unknown',
};
