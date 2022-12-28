// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_value.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EnumValueCWProxy {
  EnumValue title(String title);

  EnumValue value(Object value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnumValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnumValue(...).copyWith(id: 12, name: "My name")
  /// ````
  EnumValue call({
    String? title,
    Object? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEnumValue.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEnumValue.copyWith.fieldName(...)`
class _$EnumValueCWProxyImpl implements _$EnumValueCWProxy {
  final EnumValue _value;

  const _$EnumValueCWProxyImpl(this._value);

  @override
  EnumValue title(String title) => this(title: title);

  @override
  EnumValue value(Object value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnumValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnumValue(...).copyWith(id: 12, name: "My name")
  /// ````
  EnumValue call({
    Object? title = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return EnumValue(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as Object,
    );
  }
}

extension $EnumValueCopyWith on EnumValue {
  /// Returns a callable class that can be used as follows: `instanceOfEnumValue.copyWith(...)` or like so:`instanceOfEnumValue.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EnumValueCWProxy get copyWith => _$EnumValueCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnumValue _$EnumValueFromJson(Map<String, dynamic> json) => EnumValue(
      title: json['title'] as String,
      value: json['value'] as Object,
    );

Map<String, dynamic> _$EnumValueToJson(EnumValue instance) => <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
    };
