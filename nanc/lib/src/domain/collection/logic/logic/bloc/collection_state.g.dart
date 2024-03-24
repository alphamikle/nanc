// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$CollectionStateAutoequal on CollectionState {
  List<Object?> get _$props => [
        dataRows,
        model,
        currentPage,
        totalPages,
        isLoading,
        isError,
        notFoundAnything,
        query,
        globalSearchQuery,
        filtersBackup,
        sort,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CollectionStateCWProxy {
  CollectionState dataRows(List<Map<String, dynamic>> dataRows);

  CollectionState model(Model model);

  CollectionState currentPage(int currentPage);

  CollectionState totalPages(int totalPages);

  CollectionState isLoading(bool isLoading);

  CollectionState isError(bool isError);

  CollectionState notFoundAnything(bool notFoundAnything);

  CollectionState query(QueryField? query);

  CollectionState globalSearchQuery(QueryField? globalSearchQuery);

  CollectionState sort(Sort? sort);

  CollectionState filtersBackup(Map<String, ModelFiltersBackup> filtersBackup);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionState(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionState call({
    List<Map<String, dynamic>>? dataRows,
    Model? model,
    int? currentPage,
    int? totalPages,
    bool? isLoading,
    bool? isError,
    bool? notFoundAnything,
    QueryField? query,
    QueryField? globalSearchQuery,
    Sort? sort,
    Map<String, ModelFiltersBackup>? filtersBackup,
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
  CollectionState model(Model model) => this(model: model);

  @override
  CollectionState currentPage(int currentPage) =>
      this(currentPage: currentPage);

  @override
  CollectionState totalPages(int totalPages) => this(totalPages: totalPages);

  @override
  CollectionState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  CollectionState isError(bool isError) => this(isError: isError);

  @override
  CollectionState notFoundAnything(bool notFoundAnything) =>
      this(notFoundAnything: notFoundAnything);

  @override
  CollectionState query(QueryField? query) => this(query: query);

  @override
  CollectionState globalSearchQuery(QueryField? globalSearchQuery) =>
      this(globalSearchQuery: globalSearchQuery);

  @override
  CollectionState sort(Sort? sort) => this(sort: sort);

  @override
  CollectionState filtersBackup(
          Map<String, ModelFiltersBackup> filtersBackup) =>
      this(filtersBackup: filtersBackup);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionState(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionState call({
    Object? dataRows = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? currentPage = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isError = const $CopyWithPlaceholder(),
    Object? notFoundAnything = const $CopyWithPlaceholder(),
    Object? query = const $CopyWithPlaceholder(),
    Object? globalSearchQuery = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? filtersBackup = const $CopyWithPlaceholder(),
  }) {
    return CollectionState(
      dataRows: dataRows == const $CopyWithPlaceholder() || dataRows == null
          ? _value.dataRows
          // ignore: cast_nullable_to_non_nullable
          : dataRows as List<Map<String, dynamic>>,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as Model,
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
      isError: isError == const $CopyWithPlaceholder() || isError == null
          ? _value.isError
          // ignore: cast_nullable_to_non_nullable
          : isError as bool,
      notFoundAnything: notFoundAnything == const $CopyWithPlaceholder() ||
              notFoundAnything == null
          ? _value.notFoundAnything
          // ignore: cast_nullable_to_non_nullable
          : notFoundAnything as bool,
      query: query == const $CopyWithPlaceholder()
          ? _value.query
          // ignore: cast_nullable_to_non_nullable
          : query as QueryField?,
      globalSearchQuery: globalSearchQuery == const $CopyWithPlaceholder()
          ? _value.globalSearchQuery
          // ignore: cast_nullable_to_non_nullable
          : globalSearchQuery as QueryField?,
      sort: sort == const $CopyWithPlaceholder()
          ? _value.sort
          // ignore: cast_nullable_to_non_nullable
          : sort as Sort?,
      filtersBackup:
          filtersBackup == const $CopyWithPlaceholder() || filtersBackup == null
              ? _value.filtersBackup
              // ignore: cast_nullable_to_non_nullable
              : filtersBackup as Map<String, ModelFiltersBackup>,
    );
  }
}

extension $CollectionStateCopyWith on CollectionState {
  /// Returns a callable class that can be used as follows: `instanceOfCollectionState.copyWith(...)` or like so:`instanceOfCollectionState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CollectionStateCWProxy get copyWith => _$CollectionStateCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `CollectionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionState(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  CollectionState copyWithNull({
    bool query = false,
    bool globalSearchQuery = false,
    bool sort = false,
  }) {
    return CollectionState(
      dataRows: dataRows,
      model: model,
      currentPage: currentPage,
      totalPages: totalPages,
      isLoading: isLoading,
      isError: isError,
      notFoundAnything: notFoundAnything,
      query: query == true ? null : this.query,
      globalSearchQuery:
          globalSearchQuery == true ? null : this.globalSearchQuery,
      sort: sort == true ? null : this.sort,
      filtersBackup: filtersBackup,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionState _$CollectionStateFromJson(Map<String, dynamic> json) =>
    CollectionState(
      dataRows: (json['dataRows'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      model: Model.fromJson(json['model']),
      currentPage: json['currentPage'] as int,
      totalPages: json['totalPages'] as int,
      isLoading: json['isLoading'] as bool,
      isError: json['isError'] as bool,
      notFoundAnything: json['notFoundAnything'] as bool,
      query: queryFieldFromJson(json['query']),
      globalSearchQuery: queryFieldFromJson(json['globalSearchQuery']),
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      filtersBackup: (json['filtersBackup'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ModelFiltersBackup.fromJson(e)),
      ),
    );

Map<String, dynamic> _$CollectionStateToJson(CollectionState instance) =>
    <String, dynamic>{
      'dataRows': instance.dataRows,
      'model': instance.model.toJson(),
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'notFoundAnything': instance.notFoundAnything,
      'query': queryFieldToJson(instance.query),
      'globalSearchQuery': queryFieldToJson(instance.globalSearchQuery),
      'filtersBackup':
          instance.filtersBackup.map((k, e) => MapEntry(k, e.toJson())),
      'sort': instance.sort?.toJson(),
    };
