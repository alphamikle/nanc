// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_response_dto.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$CollectionResponseDtoAutoequal on CollectionResponseDto {
  List<Object?> get _$props => [
        page,
        totalPages,
        data,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CollectionResponseDtoCWProxy {
  CollectionResponseDto page(int page);

  CollectionResponseDto totalPages(int totalPages);

  CollectionResponseDto data(List<Map<String, dynamic>> data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionResponseDto call({
    int? page,
    int? totalPages,
    List<Map<String, dynamic>>? data,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCollectionResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCollectionResponseDto.copyWith.fieldName(...)`
class _$CollectionResponseDtoCWProxyImpl
    implements _$CollectionResponseDtoCWProxy {
  const _$CollectionResponseDtoCWProxyImpl(this._value);

  final CollectionResponseDto _value;

  @override
  CollectionResponseDto page(int page) => this(page: page);

  @override
  CollectionResponseDto totalPages(int totalPages) =>
      this(totalPages: totalPages);

  @override
  CollectionResponseDto data(List<Map<String, dynamic>> data) =>
      this(data: data);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionResponseDto call({
    Object? page = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
  }) {
    return CollectionResponseDto(
      page: page == const $CopyWithPlaceholder() || page == null
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int,
      totalPages:
          totalPages == const $CopyWithPlaceholder() || totalPages == null
              ? _value.totalPages
              // ignore: cast_nullable_to_non_nullable
              : totalPages as int,
      data: data == const $CopyWithPlaceholder() || data == null
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Map<String, dynamic>>,
    );
  }
}

extension $CollectionResponseDtoCopyWith on CollectionResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfCollectionResponseDto.copyWith(...)` or like so:`instanceOfCollectionResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CollectionResponseDtoCWProxy get copyWith =>
      _$CollectionResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionResponseDto _$CollectionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CollectionResponseDto(
      page: _pageNumberFinder(json, 'page') as int,
      totalPages: _totalPagesFinder(json, 'totalPages') as int,
      data: (_dataContainerFinder(json, 'data') as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$CollectionResponseDtoToJson(
        CollectionResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };
