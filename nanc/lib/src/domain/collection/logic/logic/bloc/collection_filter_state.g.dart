// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_filter_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$CollectionFilterStateAutoequal on CollectionFilterState {
  List<Object?> get _$props => [
        collectionModel,
        backup,
        query,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CollectionFilterStateCWProxy {
  CollectionFilterState collectionModel(Model collectionModel);

  CollectionFilterState query(QueryField? query);

  CollectionFilterState backup(Map<String, Map<String, dynamic>> backup);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionFilterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionFilterState(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionFilterState call({
    Model? collectionModel,
    QueryField? query,
    Map<String, Map<String, dynamic>>? backup,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCollectionFilterState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCollectionFilterState.copyWith.fieldName(...)`
class _$CollectionFilterStateCWProxyImpl
    implements _$CollectionFilterStateCWProxy {
  const _$CollectionFilterStateCWProxyImpl(this._value);

  final CollectionFilterState _value;

  @override
  CollectionFilterState collectionModel(Model collectionModel) =>
      this(collectionModel: collectionModel);

  @override
  CollectionFilterState query(QueryField? query) => this(query: query);

  @override
  CollectionFilterState backup(Map<String, Map<String, dynamic>> backup) =>
      this(backup: backup);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionFilterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionFilterState(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionFilterState call({
    Object? collectionModel = const $CopyWithPlaceholder(),
    Object? query = const $CopyWithPlaceholder(),
    Object? backup = const $CopyWithPlaceholder(),
  }) {
    return CollectionFilterState(
      collectionModel: collectionModel == const $CopyWithPlaceholder() ||
              collectionModel == null
          ? _value.collectionModel
          // ignore: cast_nullable_to_non_nullable
          : collectionModel as Model,
      query: query == const $CopyWithPlaceholder()
          ? _value.query
          // ignore: cast_nullable_to_non_nullable
          : query as QueryField?,
      backup: backup == const $CopyWithPlaceholder() || backup == null
          ? _value.backup
          // ignore: cast_nullable_to_non_nullable
          : backup as Map<String, Map<String, dynamic>>,
    );
  }
}

extension $CollectionFilterStateCopyWith on CollectionFilterState {
  /// Returns a callable class that can be used as follows: `instanceOfCollectionFilterState.copyWith(...)` or like so:`instanceOfCollectionFilterState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CollectionFilterStateCWProxy get copyWith =>
      _$CollectionFilterStateCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `CollectionFilterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionFilterState(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  CollectionFilterState copyWithNull({
    bool query = false,
  }) {
    return CollectionFilterState(
      collectionModel: collectionModel,
      query: query == true ? null : this.query,
      backup: backup,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionFilterState _$CollectionFilterStateFromJson(
        Map<String, dynamic> json) =>
    CollectionFilterState(
      collectionModel: Model.fromJson(json['collectionModel']),
      query: queryFieldFromJson(json['query']),
      backup: (json['backup'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Map<String, dynamic>),
      ),
    );

Map<String, dynamic> _$CollectionFilterStateToJson(
        CollectionFilterState instance) =>
    <String, dynamic>{
      'collectionModel': instance.collectionModel.toJson(),
      'backup': instance.backup,
      'query': queryFieldToJson(instance.query),
    };
