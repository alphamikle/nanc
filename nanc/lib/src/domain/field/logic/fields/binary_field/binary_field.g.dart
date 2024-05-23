// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binary_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$BinaryFieldAutoequal on BinaryField {
  List<Object?> get _$props => [
        id,
        name,
        showInList,
        isRequired,
        sort,
        realField,
        validator,
        type,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BinaryFieldCWProxy {
  BinaryField name(String name);

  BinaryField id(String? id);

  BinaryField showInList(bool showInList);

  BinaryField isRequired(bool isRequired);

  BinaryField sort(int sort);

  BinaryField validator(String? Function(Object?)? validator);

  BinaryField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BinaryField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BinaryField(...).copyWith(id: 12, name: "My name")
  /// ````
  BinaryField call({
    String? name,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBinaryField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBinaryField.copyWith.fieldName(...)`
class _$BinaryFieldCWProxyImpl implements _$BinaryFieldCWProxy {
  const _$BinaryFieldCWProxyImpl(this._value);

  final BinaryField _value;

  @override
  BinaryField name(String name) => this(name: name);

  @override
  BinaryField id(String? id) => this(id: id);

  @override
  BinaryField showInList(bool showInList) => this(showInList: showInList);

  @override
  BinaryField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  BinaryField sort(int sort) => this(sort: sort);

  @override
  BinaryField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  BinaryField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BinaryField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BinaryField(...).copyWith(id: 12, name: "My name")
  /// ````
  BinaryField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return BinaryField(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      showInList:
          showInList == const $CopyWithPlaceholder() || showInList == null
              ? _value.showInList
              // ignore: cast_nullable_to_non_nullable
              : showInList as bool,
      isRequired:
          isRequired == const $CopyWithPlaceholder() || isRequired == null
              ? _value.isRequired
              // ignore: cast_nullable_to_non_nullable
              : isRequired as bool,
      sort: sort == const $CopyWithPlaceholder() || sort == null
          ? _value.sort
          // ignore: cast_nullable_to_non_nullable
          : sort as int,
      validator: validator == const $CopyWithPlaceholder()
          ? _value.validator
          // ignore: cast_nullable_to_non_nullable
          : validator as String? Function(Object?)?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as FieldType,
    );
  }
}

extension $BinaryFieldCopyWith on BinaryField {
  /// Returns a callable class that can be used as follows: `instanceOfBinaryField.copyWith(...)` or like so:`instanceOfBinaryField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BinaryFieldCWProxy get copyWith => _$BinaryFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BinaryField _$BinaryFieldFromJson(Map<String, dynamic> json) => BinaryField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.binaryField,
    );

Map<String, dynamic> _$BinaryFieldToJson(BinaryField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'type': _$FieldTypeEnumMap[instance.type]!,
    };

const _$FieldTypeEnumMap = {
  FieldType.custom: 'custom',
  FieldType.field: 'field',
  FieldType.dateField: 'dateField',
  FieldType.enumField: 'enumField',
  FieldType.iconField: 'iconField',
  FieldType.idField: 'idField',
  FieldType.stringField: 'stringField',
  FieldType.multiSelectorField: 'multiSelectorField',
  FieldType.numberField: 'numberField',
  FieldType.queryFilterField: 'queryFilterField',
  FieldType.queryFilterValueField: 'queryFilterValueField',
  FieldType.selectorField: 'selectorField',
  FieldType.boolField: 'boolField',
  FieldType.dynamicField: 'dynamicField',
  FieldType.structuredField: 'structuredField',
  FieldType.structureField: 'structureField',
  FieldType.colorField: 'colorField',
  FieldType.screenField: 'screenField',
  FieldType.binaryField: 'binaryField',
  FieldType.headerField: 'headerField',
  FieldType.groupField: 'groupField',
  FieldType.fontField: 'fontField',
  FieldType.modelsSelectorField: 'modelsSelectorField',
  FieldType.titleFieldsField: 'titleFieldsField',
};
