// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_table.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ThirdTableAutoequal on ThirdTable {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props =>
      [relationsEntity, parentEntityIdName, childEntityIdName];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ThirdTableCWProxy {
  ThirdTable relationsEntity(Model relationsEntity);

  ThirdTable parentEntityIdName(String parentEntityIdName);

  ThirdTable childEntityIdName(String childEntityIdName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThirdTable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThirdTable(...).copyWith(id: 12, name: "My name")
  /// ````
  ThirdTable call({
    Model? relationsEntity,
    String? parentEntityIdName,
    String? childEntityIdName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfThirdTable.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfThirdTable.copyWith.fieldName(...)`
class _$ThirdTableCWProxyImpl implements _$ThirdTableCWProxy {
  const _$ThirdTableCWProxyImpl(this._value);

  final ThirdTable _value;

  @override
  ThirdTable relationsEntity(Model relationsEntity) =>
      this(relationsEntity: relationsEntity);

  @override
  ThirdTable parentEntityIdName(String parentEntityIdName) =>
      this(parentEntityIdName: parentEntityIdName);

  @override
  ThirdTable childEntityIdName(String childEntityIdName) =>
      this(childEntityIdName: childEntityIdName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThirdTable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThirdTable(...).copyWith(id: 12, name: "My name")
  /// ````
  ThirdTable call({
    Object? relationsEntity = const $CopyWithPlaceholder(),
    Object? parentEntityIdName = const $CopyWithPlaceholder(),
    Object? childEntityIdName = const $CopyWithPlaceholder(),
  }) {
    return ThirdTable(
      relationsEntity: relationsEntity == const $CopyWithPlaceholder() ||
              relationsEntity == null
          ? _value.relationsEntity
          // ignore: cast_nullable_to_non_nullable
          : relationsEntity as Model,
      parentEntityIdName: parentEntityIdName == const $CopyWithPlaceholder() ||
              parentEntityIdName == null
          ? _value.parentEntityIdName
          // ignore: cast_nullable_to_non_nullable
          : parentEntityIdName as String,
      childEntityIdName: childEntityIdName == const $CopyWithPlaceholder() ||
              childEntityIdName == null
          ? _value.childEntityIdName
          // ignore: cast_nullable_to_non_nullable
          : childEntityIdName as String,
    );
  }
}

extension $ThirdTableCopyWith on ThirdTable {
  /// Returns a callable class that can be used as follows: `instanceOfThirdTable.copyWith(...)` or like so:`instanceOfThirdTable.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ThirdTableCWProxy get copyWith => _$ThirdTableCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThirdTable _$ThirdTableFromJson(Map<String, dynamic> json) => ThirdTable(
      relationsEntity: Model.fromJson(json['relationsEntity']),
      parentEntityIdName: json['parentEntityIdName'] as String,
      childEntityIdName: json['childEntityIdName'] as String,
    );

Map<String, dynamic> _$ThirdTableToJson(ThirdTable instance) =>
    <String, dynamic>{
      'relationsEntity': instance.relationsEntity.toJson(),
      'parentEntityIdName': instance.parentEntityIdName,
      'childEntityIdName': instance.childEntityIdName,
    };
