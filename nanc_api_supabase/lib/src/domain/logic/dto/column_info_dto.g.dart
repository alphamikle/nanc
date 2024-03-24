// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'column_info_dto.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ColumnInfoDtoAutoequal on ColumnInfoDto {
  List<Object?> get _$props => [
        dataType,
        columnName,
        isNullable,
        characterMaximumLength,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ColumnInfoDtoCWProxy {
  ColumnInfoDto dataType(String dataType);

  ColumnInfoDto columnName(String columnName);

  ColumnInfoDto isNullable(String isNullable);

  ColumnInfoDto characterMaximumLength(int? characterMaximumLength);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ColumnInfoDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ColumnInfoDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ColumnInfoDto call({
    String? dataType,
    String? columnName,
    String? isNullable,
    int? characterMaximumLength,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfColumnInfoDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfColumnInfoDto.copyWith.fieldName(...)`
class _$ColumnInfoDtoCWProxyImpl implements _$ColumnInfoDtoCWProxy {
  const _$ColumnInfoDtoCWProxyImpl(this._value);

  final ColumnInfoDto _value;

  @override
  ColumnInfoDto dataType(String dataType) => this(dataType: dataType);

  @override
  ColumnInfoDto columnName(String columnName) => this(columnName: columnName);

  @override
  ColumnInfoDto isNullable(String isNullable) => this(isNullable: isNullable);

  @override
  ColumnInfoDto characterMaximumLength(int? characterMaximumLength) =>
      this(characterMaximumLength: characterMaximumLength);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ColumnInfoDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ColumnInfoDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ColumnInfoDto call({
    Object? dataType = const $CopyWithPlaceholder(),
    Object? columnName = const $CopyWithPlaceholder(),
    Object? isNullable = const $CopyWithPlaceholder(),
    Object? characterMaximumLength = const $CopyWithPlaceholder(),
  }) {
    return ColumnInfoDto(
      dataType: dataType == const $CopyWithPlaceholder() || dataType == null
          ? _value.dataType
          // ignore: cast_nullable_to_non_nullable
          : dataType as String,
      columnName:
          columnName == const $CopyWithPlaceholder() || columnName == null
              ? _value.columnName
              // ignore: cast_nullable_to_non_nullable
              : columnName as String,
      isNullable:
          isNullable == const $CopyWithPlaceholder() || isNullable == null
              ? _value.isNullable
              // ignore: cast_nullable_to_non_nullable
              : isNullable as String,
      characterMaximumLength:
          characterMaximumLength == const $CopyWithPlaceholder()
              ? _value.characterMaximumLength
              // ignore: cast_nullable_to_non_nullable
              : characterMaximumLength as int?,
    );
  }
}

extension $ColumnInfoDtoCopyWith on ColumnInfoDto {
  /// Returns a callable class that can be used as follows: `instanceOfColumnInfoDto.copyWith(...)` or like so:`instanceOfColumnInfoDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ColumnInfoDtoCWProxy get copyWith => _$ColumnInfoDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColumnInfoDto _$ColumnInfoDtoFromJson(Map<String, dynamic> json) =>
    ColumnInfoDto(
      dataType: json['data_type'] as String,
      columnName: json['column_name'] as String,
      isNullable: json['is_nullable'] as String,
      characterMaximumLength: json['character_maximum_length'] as int?,
    );

Map<String, dynamic> _$ColumnInfoDtoToJson(ColumnInfoDto instance) =>
    <String, dynamic>{
      'data_type': instance.dataType,
      'column_name': instance.columnName,
      'is_nullable': instance.isNullable,
      'character_maximum_length': instance.characterMaximumLength,
    };
