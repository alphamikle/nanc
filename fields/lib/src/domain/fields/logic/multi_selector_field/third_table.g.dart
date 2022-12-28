// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_table.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ThirdTableCWProxy {
  ThirdTable childEntityIdName(String childEntityIdName);

  ThirdTable parentEntityIdName(String parentEntityIdName);

  ThirdTable relationsEntity(Model relationsEntity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThirdTable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThirdTable(...).copyWith(id: 12, name: "My name")
  /// ````
  ThirdTable call({
    String? childEntityIdName,
    String? parentEntityIdName,
    Model? relationsEntity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfThirdTable.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfThirdTable.copyWith.fieldName(...)`
class _$ThirdTableCWProxyImpl implements _$ThirdTableCWProxy {
  final ThirdTable _value;

  const _$ThirdTableCWProxyImpl(this._value);

  @override
  ThirdTable childEntityIdName(String childEntityIdName) =>
      this(childEntityIdName: childEntityIdName);

  @override
  ThirdTable parentEntityIdName(String parentEntityIdName) =>
      this(parentEntityIdName: parentEntityIdName);

  @override
  ThirdTable relationsEntity(Model relationsEntity) =>
      this(relationsEntity: relationsEntity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThirdTable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThirdTable(...).copyWith(id: 12, name: "My name")
  /// ````
  ThirdTable call({
    Object? childEntityIdName = const $CopyWithPlaceholder(),
    Object? parentEntityIdName = const $CopyWithPlaceholder(),
    Object? relationsEntity = const $CopyWithPlaceholder(),
  }) {
    return ThirdTable(
      childEntityIdName: childEntityIdName == const $CopyWithPlaceholder() ||
              childEntityIdName == null
          ? _value.childEntityIdName
          // ignore: cast_nullable_to_non_nullable
          : childEntityIdName as String,
      parentEntityIdName: parentEntityIdName == const $CopyWithPlaceholder() ||
              parentEntityIdName == null
          ? _value.parentEntityIdName
          // ignore: cast_nullable_to_non_nullable
          : parentEntityIdName as String,
      relationsEntity: relationsEntity == const $CopyWithPlaceholder() ||
              relationsEntity == null
          ? _value.relationsEntity
          // ignore: cast_nullable_to_non_nullable
          : relationsEntity as Model,
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
