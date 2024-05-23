// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_filters_backup.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ModelFiltersBackupAutoequal on ModelFiltersBackup {
  List<Object?> get _$props => [
        model,
        totalPages,
        currentPage,
        globalSearchValue,
        query,
        globalSearchQuery,
        sort,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ModelFiltersBackupCWProxy {
  ModelFiltersBackup model(Model model);

  ModelFiltersBackup totalPages(int totalPages);

  ModelFiltersBackup currentPage(int currentPage);

  ModelFiltersBackup globalSearchValue(String globalSearchValue);

  ModelFiltersBackup query(QueryField? query);

  ModelFiltersBackup globalSearchQuery(QueryField? globalSearchQuery);

  ModelFiltersBackup sort(Sort? sort);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelFiltersBackup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelFiltersBackup(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelFiltersBackup call({
    Model? model,
    int? totalPages,
    int? currentPage,
    String? globalSearchValue,
    QueryField? query,
    QueryField? globalSearchQuery,
    Sort? sort,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfModelFiltersBackup.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfModelFiltersBackup.copyWith.fieldName(...)`
class _$ModelFiltersBackupCWProxyImpl implements _$ModelFiltersBackupCWProxy {
  const _$ModelFiltersBackupCWProxyImpl(this._value);

  final ModelFiltersBackup _value;

  @override
  ModelFiltersBackup model(Model model) => this(model: model);

  @override
  ModelFiltersBackup totalPages(int totalPages) => this(totalPages: totalPages);

  @override
  ModelFiltersBackup currentPage(int currentPage) =>
      this(currentPage: currentPage);

  @override
  ModelFiltersBackup globalSearchValue(String globalSearchValue) =>
      this(globalSearchValue: globalSearchValue);

  @override
  ModelFiltersBackup query(QueryField? query) => this(query: query);

  @override
  ModelFiltersBackup globalSearchQuery(QueryField? globalSearchQuery) =>
      this(globalSearchQuery: globalSearchQuery);

  @override
  ModelFiltersBackup sort(Sort? sort) => this(sort: sort);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelFiltersBackup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelFiltersBackup(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelFiltersBackup call({
    Object? model = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
    Object? currentPage = const $CopyWithPlaceholder(),
    Object? globalSearchValue = const $CopyWithPlaceholder(),
    Object? query = const $CopyWithPlaceholder(),
    Object? globalSearchQuery = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
  }) {
    return ModelFiltersBackup(
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as Model,
      totalPages:
          totalPages == const $CopyWithPlaceholder() || totalPages == null
              ? _value.totalPages
              // ignore: cast_nullable_to_non_nullable
              : totalPages as int,
      currentPage:
          currentPage == const $CopyWithPlaceholder() || currentPage == null
              ? _value.currentPage
              // ignore: cast_nullable_to_non_nullable
              : currentPage as int,
      globalSearchValue: globalSearchValue == const $CopyWithPlaceholder() ||
              globalSearchValue == null
          ? _value.globalSearchValue
          // ignore: cast_nullable_to_non_nullable
          : globalSearchValue as String,
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
    );
  }
}

extension $ModelFiltersBackupCopyWith on ModelFiltersBackup {
  /// Returns a callable class that can be used as follows: `instanceOfModelFiltersBackup.copyWith(...)` or like so:`instanceOfModelFiltersBackup.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ModelFiltersBackupCWProxy get copyWith =>
      _$ModelFiltersBackupCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `ModelFiltersBackup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelFiltersBackup(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  ModelFiltersBackup copyWithNull({
    bool query = false,
    bool globalSearchQuery = false,
    bool sort = false,
  }) {
    return ModelFiltersBackup(
      model: model,
      totalPages: totalPages,
      currentPage: currentPage,
      globalSearchValue: globalSearchValue,
      query: query == true ? null : this.query,
      globalSearchQuery:
          globalSearchQuery == true ? null : this.globalSearchQuery,
      sort: sort == true ? null : this.sort,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelFiltersBackup _$ModelFiltersBackupFromJson(Map<String, dynamic> json) =>
    ModelFiltersBackup(
      model: Model.fromJson(json['model']),
      totalPages: (json['totalPages'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      globalSearchValue: json['globalSearchValue'] as String,
      query: queryFieldFromJson(json['query']),
      globalSearchQuery: queryFieldFromJson(json['globalSearchQuery']),
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModelFiltersBackupToJson(ModelFiltersBackup instance) =>
    <String, dynamic>{
      'model': instance.model.toJson(),
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'globalSearchValue': instance.globalSearchValue,
      'query': queryFieldToJson(instance.query),
      'globalSearchQuery': queryFieldToJson(instance.globalSearchQuery),
      'sort': instance.sort?.toJson(),
    };
