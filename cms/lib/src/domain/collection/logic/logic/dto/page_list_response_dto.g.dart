// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_list_response_dto.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$PageListResponseDtoAutoequal on PageListResponseDto {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [page, totalPages, data];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PageListResponseDtoCWProxy {
  PageListResponseDto page(int page);

  PageListResponseDto totalPages(int totalPages);

  PageListResponseDto data(List<Map<String, dynamic>> data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageListResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageListResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  PageListResponseDto call({
    int? page,
    int? totalPages,
    List<Map<String, dynamic>>? data,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPageListResponseDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPageListResponseDto.copyWith.fieldName(...)`
class _$PageListResponseDtoCWProxyImpl implements _$PageListResponseDtoCWProxy {
  const _$PageListResponseDtoCWProxyImpl(this._value);

  final PageListResponseDto _value;

  @override
  PageListResponseDto page(int page) => this(page: page);

  @override
  PageListResponseDto totalPages(int totalPages) =>
      this(totalPages: totalPages);

  @override
  PageListResponseDto data(List<Map<String, dynamic>> data) => this(data: data);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageListResponseDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageListResponseDto(...).copyWith(id: 12, name: "My name")
  /// ````
  PageListResponseDto call({
    Object? page = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
  }) {
    return PageListResponseDto(
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

extension $PageListResponseDtoCopyWith on PageListResponseDto {
  /// Returns a callable class that can be used as follows: `instanceOfPageListResponseDto.copyWith(...)` or like so:`instanceOfPageListResponseDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PageListResponseDtoCWProxy get copyWith =>
      _$PageListResponseDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageListResponseDto _$PageListResponseDtoFromJson(Map<String, dynamic> json) =>
    PageListResponseDto(
      page: json['page'] as int? ?? 1,
      totalPages: _findTotalPagesKey(json, 'totalPages') as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$PageListResponseDtoToJson(
        PageListResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };
