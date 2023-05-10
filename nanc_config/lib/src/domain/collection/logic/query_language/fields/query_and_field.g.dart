// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_and_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$QueryAndFieldAutoequal on QueryAndField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [fields, type];
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
