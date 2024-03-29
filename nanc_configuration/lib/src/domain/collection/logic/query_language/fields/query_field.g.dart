// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$QueryAndFieldAutoequal on QueryAndField {
  List<Object?> get _$props => [
        fields,
        type,
      ];
}

extension _$QueryOrFieldAutoequal on QueryOrField {
  List<Object?> get _$props => [
        fields,
        type,
      ];
}

extension _$QueryValueFieldAutoequal on QueryValueField {
  List<Object?> get _$props => [
        fieldId,
        value,
        type,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QueryAndFieldCWProxy {
  QueryAndField fields(List<QueryField> fields);

  QueryAndField type(QueryFieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryAndField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryAndField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryAndField call({
    List<QueryField>? fields,
    QueryFieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueryAndField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueryAndField.copyWith.fieldName(...)`
class _$QueryAndFieldCWProxyImpl implements _$QueryAndFieldCWProxy {
  const _$QueryAndFieldCWProxyImpl(this._value);

  final QueryAndField _value;

  @override
  QueryAndField fields(List<QueryField> fields) => this(fields: fields);

  @override
  QueryAndField type(QueryFieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryAndField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryAndField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryAndField call({
    Object? fields = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return QueryAndField(
      fields: fields == const $CopyWithPlaceholder() || fields == null
          ? _value.fields
          // ignore: cast_nullable_to_non_nullable
          : fields as List<QueryField>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as QueryFieldType,
    );
  }
}

extension $QueryAndFieldCopyWith on QueryAndField {
  /// Returns a callable class that can be used as follows: `instanceOfQueryAndField.copyWith(...)` or like so:`instanceOfQueryAndField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueryAndFieldCWProxy get copyWith => _$QueryAndFieldCWProxyImpl(this);
}

abstract class _$QueryOrFieldCWProxy {
  QueryOrField fields(List<QueryField> fields);

  QueryOrField type(QueryFieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryOrField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryOrField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryOrField call({
    List<QueryField>? fields,
    QueryFieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueryOrField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueryOrField.copyWith.fieldName(...)`
class _$QueryOrFieldCWProxyImpl implements _$QueryOrFieldCWProxy {
  const _$QueryOrFieldCWProxyImpl(this._value);

  final QueryOrField _value;

  @override
  QueryOrField fields(List<QueryField> fields) => this(fields: fields);

  @override
  QueryOrField type(QueryFieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryOrField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryOrField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryOrField call({
    Object? fields = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return QueryOrField(
      fields: fields == const $CopyWithPlaceholder() || fields == null
          ? _value.fields
          // ignore: cast_nullable_to_non_nullable
          : fields as List<QueryField>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as QueryFieldType,
    );
  }
}

extension $QueryOrFieldCopyWith on QueryOrField {
  /// Returns a callable class that can be used as follows: `instanceOfQueryOrField.copyWith(...)` or like so:`instanceOfQueryOrField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueryOrFieldCWProxy get copyWith => _$QueryOrFieldCWProxyImpl(this);
}

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

QueryField _$QueryFieldFromJson(Map<String, dynamic> json) => QueryField();

Map<String, dynamic> _$QueryFieldToJson(QueryField instance) =>
    <String, dynamic>{};

QueryAndField _$QueryAndFieldFromJson(Map<String, dynamic> json) =>
    QueryAndField(
      fields: json['fields'] == null
          ? const []
          : queryFieldsFromJson(json['fields']),
      type: $enumDecodeNullable(_$QueryFieldTypeEnumMap, json['type']) ??
          QueryFieldType.and,
    );

Map<String, dynamic> _$QueryAndFieldToJson(QueryAndField instance) =>
    <String, dynamic>{
      'fields': queryFieldsToJson(instance.fields),
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

QueryConditionField _$QueryConditionFieldFromJson(Map<String, dynamic> json) =>
    QueryConditionField();

Map<String, dynamic> _$QueryConditionFieldToJson(
        QueryConditionField instance) =>
    <String, dynamic>{};

QueryOrField _$QueryOrFieldFromJson(Map<String, dynamic> json) => QueryOrField(
      fields: json['fields'] == null
          ? const []
          : queryFieldsFromJson(json['fields']),
      type: $enumDecodeNullable(_$QueryFieldTypeEnumMap, json['type']) ??
          QueryFieldType.or,
    );

Map<String, dynamic> _$QueryOrFieldToJson(QueryOrField instance) =>
    <String, dynamic>{
      'fields': queryFieldsToJson(instance.fields),
      'type': _$QueryFieldTypeEnumMap[instance.type]!,
    };

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
