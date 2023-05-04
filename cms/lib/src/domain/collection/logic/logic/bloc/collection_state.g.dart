// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$CollectionStateAutoequal on CollectionState {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props =>
      [dataRows, modelId, currentPage, totalPages, isLoading, notFoundAnything];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CollectionStateCWProxy {
  CollectionState dataRows(List<Map<String, dynamic>> dataRows);

  CollectionState modelId(String modelId);

  CollectionState currentPage(int currentPage);

  CollectionState totalPages(int totalPages);

  CollectionState isLoading(bool isLoading);

  CollectionState notFoundAnything(bool notFoundAnything);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionState(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionState call({
    List<Map<String, dynamic>>? dataRows,
    String? modelId,
    int? currentPage,
    int? totalPages,
    bool? isLoading,
    bool? notFoundAnything,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCollectionState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCollectionState.copyWith.fieldName(...)`
class _$CollectionStateCWProxyImpl implements _$CollectionStateCWProxy {
  const _$CollectionStateCWProxyImpl(this._value);

  final CollectionState _value;

  @override
  CollectionState dataRows(List<Map<String, dynamic>> dataRows) =>
      this(dataRows: dataRows);

  @override
  CollectionState modelId(String modelId) => this(modelId: modelId);

  @override
  CollectionState currentPage(int currentPage) =>
      this(currentPage: currentPage);

  @override
  CollectionState totalPages(int totalPages) => this(totalPages: totalPages);

  @override
  CollectionState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  CollectionState notFoundAnything(bool notFoundAnything) =>
      this(notFoundAnything: notFoundAnything);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionState(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionState call({
    Object? dataRows = const $CopyWithPlaceholder(),
    Object? modelId = const $CopyWithPlaceholder(),
    Object? currentPage = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? notFoundAnything = const $CopyWithPlaceholder(),
  }) {
    return CollectionState(
      dataRows: dataRows == const $CopyWithPlaceholder() || dataRows == null
          ? _value.dataRows
          // ignore: cast_nullable_to_non_nullable
          : dataRows as List<Map<String, dynamic>>,
      modelId: modelId == const $CopyWithPlaceholder() || modelId == null
          ? _value.modelId
          // ignore: cast_nullable_to_non_nullable
          : modelId as String,
      currentPage:
          currentPage == const $CopyWithPlaceholder() || currentPage == null
              ? _value.currentPage
              // ignore: cast_nullable_to_non_nullable
              : currentPage as int,
      totalPages:
          totalPages == const $CopyWithPlaceholder() || totalPages == null
              ? _value.totalPages
              // ignore: cast_nullable_to_non_nullable
              : totalPages as int,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      notFoundAnything: notFoundAnything == const $CopyWithPlaceholder() ||
              notFoundAnything == null
          ? _value.notFoundAnything
          // ignore: cast_nullable_to_non_nullable
          : notFoundAnything as bool,
    );
  }
}

extension $CollectionStateCopyWith on CollectionState {
  /// Returns a callable class that can be used as follows: `instanceOfCollectionState.copyWith(...)` or like so:`instanceOfCollectionState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CollectionStateCWProxy get copyWith => _$CollectionStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionState _$CollectionStateFromJson(Map<String, dynamic> json) =>
    CollectionState(
      dataRows: (json['dataRows'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      modelId: json['modelId'] as String,
      currentPage: json['currentPage'] as int,
      totalPages: json['totalPages'] as int,
      isLoading: json['isLoading'] as bool,
      notFoundAnything: json['notFoundAnything'] as bool,
    );

Map<String, dynamic> _$CollectionStateToJson(CollectionState instance) =>
    <String, dynamic>{
      'dataRows': instance.dataRows,
      'modelId': instance.modelId,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'isLoading': instance.isLoading,
      'notFoundAnything': instance.notFoundAnything,
    };
