// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ScreenFieldAutoequal on ScreenField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [screenContentType];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScreenFieldCWProxy {
  ScreenField name(String name);

  ScreenField screenContentType(ScreenContentType screenContentType);

  ScreenField id(String? id);

  ScreenField showInList(bool showInList);

  ScreenField isRequired(bool isRequired);

  ScreenField sort(int sort);

  ScreenField width(double? width);

  ScreenField validator(String? Function(Object?)? validator);

  ScreenField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScreenField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScreenField(...).copyWith(id: 12, name: "My name")
  /// ````
  ScreenField call({
    String? name,
    ScreenContentType? screenContentType,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    double? width,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfScreenField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfScreenField.copyWith.fieldName(...)`
class _$ScreenFieldCWProxyImpl implements _$ScreenFieldCWProxy {
  const _$ScreenFieldCWProxyImpl(this._value);

  final ScreenField _value;

  @override
  ScreenField name(String name) => this(name: name);

  @override
  ScreenField screenContentType(ScreenContentType screenContentType) =>
      this(screenContentType: screenContentType);

  @override
  ScreenField id(String? id) => this(id: id);

  @override
  ScreenField showInList(bool showInList) => this(showInList: showInList);

  @override
  ScreenField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  ScreenField sort(int sort) => this(sort: sort);

  @override
  ScreenField width(double? width) => this(width: width);

  @override
  ScreenField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  ScreenField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScreenField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScreenField(...).copyWith(id: 12, name: "My name")
  /// ````
  ScreenField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? screenContentType = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return ScreenField(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      screenContentType: screenContentType == const $CopyWithPlaceholder() ||
              screenContentType == null
          ? _value.screenContentType
          // ignore: cast_nullable_to_non_nullable
          : screenContentType as ScreenContentType,
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
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as double?,
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

extension $ScreenFieldCopyWith on ScreenField {
  /// Returns a callable class that can be used as follows: `instanceOfScreenField.copyWith(...)` or like so:`instanceOfScreenField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScreenFieldCWProxy get copyWith => _$ScreenFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenField _$ScreenFieldFromJson(Map<String, dynamic> json) => ScreenField(
      name: json['name'] as String,
      screenContentType:
          $enumDecode(_$ScreenContentTypeEnumMap, json['screenContentType']),
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.screenField,
    );

Map<String, dynamic> _$ScreenFieldToJson(ScreenField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'screenContentType':
          _$ScreenContentTypeEnumMap[instance.screenContentType]!,
    };

const _$ScreenContentTypeEnumMap = {
  ScreenContentType.scrollable: 'scrollable',
  ScreenContentType.stack: 'stack',
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
  FieldType.selectorField: 'selectorField',
  FieldType.boolField: 'boolField',
  FieldType.dynamicField: 'dynamicField',
  FieldType.structuredField: 'structuredField',
  FieldType.structureField: 'structureField',
  FieldType.colorField: 'colorField',
  FieldType.screenField: 'screenField',
  FieldType.headerField: 'headerField',
  FieldType.groupField: 'groupField',
  FieldType.fontField: 'fontField',
  FieldType.modelsSelectorField: 'modelsSelectorField',
  FieldType.titleFieldsField: 'titleFieldsField',
};
