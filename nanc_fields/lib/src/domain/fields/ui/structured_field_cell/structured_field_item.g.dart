// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structured_field_item.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$StructuredFieldItemAutoequal on StructuredFieldItem {
  List<Object?> get _$props => [items];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StructuredFieldItemCWProxy {
  StructuredFieldItem items(List<DynamicFieldItem> items);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StructuredFieldItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StructuredFieldItem(...).copyWith(id: 12, name: "My name")
  /// ````
  StructuredFieldItem call({
    List<DynamicFieldItem>? items,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStructuredFieldItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStructuredFieldItem.copyWith.fieldName(...)`
class _$StructuredFieldItemCWProxyImpl implements _$StructuredFieldItemCWProxy {
  const _$StructuredFieldItemCWProxyImpl(this._value);

  final StructuredFieldItem _value;

  @override
  StructuredFieldItem items(List<DynamicFieldItem> items) => this(items: items);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StructuredFieldItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StructuredFieldItem(...).copyWith(id: 12, name: "My name")
  /// ````
  StructuredFieldItem call({
    Object? items = const $CopyWithPlaceholder(),
  }) {
    return StructuredFieldItem(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<DynamicFieldItem>,
    );
  }
}

extension $StructuredFieldItemCopyWith on StructuredFieldItem {
  /// Returns a callable class that can be used as follows: `instanceOfStructuredFieldItem.copyWith(...)` or like so:`instanceOfStructuredFieldItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StructuredFieldItemCWProxy get copyWith =>
      _$StructuredFieldItemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StructuredFieldItem _$StructuredFieldItemFromJson(Map<String, dynamic> json) =>
    StructuredFieldItem(
      items: (json['items'] as List<dynamic>)
          .map(DynamicFieldItem.fromJson)
          .toList(),
    );

Map<String, dynamic> _$StructuredFieldItemToJson(
        StructuredFieldItem instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
