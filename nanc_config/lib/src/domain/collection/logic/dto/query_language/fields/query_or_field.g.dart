// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_or_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$QueryOrFieldAutoequal on QueryOrField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [fields, type];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
