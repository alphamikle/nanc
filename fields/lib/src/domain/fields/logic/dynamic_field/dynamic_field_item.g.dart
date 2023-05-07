// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_field_item.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$DynamicFieldItemAutoequal on DynamicFieldItem {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [controller, value, field, children];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DynamicFieldItemCWProxy {
  DynamicFieldItem controller(TextEditingController controller);

  DynamicFieldItem value(Object? value);

  DynamicFieldItem field(Field field);

  DynamicFieldItem children(List<DynamicFieldItem> children);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DynamicFieldItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DynamicFieldItem(...).copyWith(id: 12, name: "My name")
  /// ````
  DynamicFieldItem call({
    TextEditingController? controller,
    Object? value,
    Field? field,
    List<DynamicFieldItem>? children,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDynamicFieldItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDynamicFieldItem.copyWith.fieldName(...)`
class _$DynamicFieldItemCWProxyImpl implements _$DynamicFieldItemCWProxy {
  const _$DynamicFieldItemCWProxyImpl(this._value);

  final DynamicFieldItem _value;

  @override
  DynamicFieldItem controller(TextEditingController controller) =>
      this(controller: controller);

  @override
  DynamicFieldItem value(Object? value) => this(value: value);

  @override
  DynamicFieldItem field(Field field) => this(field: field);

  @override
  DynamicFieldItem children(List<DynamicFieldItem> children) =>
      this(children: children);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DynamicFieldItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DynamicFieldItem(...).copyWith(id: 12, name: "My name")
  /// ````
  DynamicFieldItem call({
    Object? controller = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? field = const $CopyWithPlaceholder(),
    Object? children = const $CopyWithPlaceholder(),
  }) {
    return DynamicFieldItem(
      controller:
          controller == const $CopyWithPlaceholder() || controller == null
              ? _value.controller
              // ignore: cast_nullable_to_non_nullable
              : controller as TextEditingController,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as Object?,
      field: field == const $CopyWithPlaceholder() || field == null
          ? _value.field
          // ignore: cast_nullable_to_non_nullable
          : field as Field,
      children: children == const $CopyWithPlaceholder() || children == null
          ? _value.children
          // ignore: cast_nullable_to_non_nullable
          : children as List<DynamicFieldItem>,
    );
  }
}

extension $DynamicFieldItemCopyWith on DynamicFieldItem {
  /// Returns a callable class that can be used as follows: `instanceOfDynamicFieldItem.copyWith(...)` or like so:`instanceOfDynamicFieldItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DynamicFieldItemCWProxy get copyWith => _$DynamicFieldItemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicFieldItem _$DynamicFieldItemFromJson(Map<String, dynamic> json) =>
    DynamicFieldItem(
      controller:
          _controllerFromJson(_readDataForTheController(json, 'controller')),
      value: json['value'],
      field: _fieldFromJson(json['field']),
      children: (json['children'] as List<dynamic>?)
              ?.map(DynamicFieldItem.fromJson)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DynamicFieldItemToJson(DynamicFieldItem instance) =>
    <String, dynamic>{
      'controller': _controllerToJson(instance.controller),
      'value': instance.value,
      'field': _fieldToJson(instance.field),
      'children': instance.children.map((e) => e.toJson()).toList(),
    };
