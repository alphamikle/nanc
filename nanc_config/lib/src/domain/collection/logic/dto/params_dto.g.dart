// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_dto.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ParamsDtoAutoequal on ParamsDto {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [page, limit, sort];
}

extension _$SortAutoequal on Sort {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [field, order];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ParamsDtoCWProxy {
  ParamsDto page(int page);

  ParamsDto limit(int limit);

  ParamsDto sort(Sort sort);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ParamsDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ParamsDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ParamsDto call({
    int? page,
    int? limit,
    Sort? sort,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfParamsDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfParamsDto.copyWith.fieldName(...)`
class _$ParamsDtoCWProxyImpl implements _$ParamsDtoCWProxy {
  const _$ParamsDtoCWProxyImpl(this._value);

  final ParamsDto _value;

  @override
  ParamsDto page(int page) => this(page: page);

  @override
  ParamsDto limit(int limit) => this(limit: limit);

  @override
  ParamsDto sort(Sort sort) => this(sort: sort);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ParamsDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ParamsDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ParamsDto call({
    Object? page = const $CopyWithPlaceholder(),
    Object? limit = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
  }) {
    return ParamsDto(
      page: page == const $CopyWithPlaceholder() || page == null
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int,
      limit: limit == const $CopyWithPlaceholder() || limit == null
          ? _value.limit
          // ignore: cast_nullable_to_non_nullable
          : limit as int,
      sort: sort == const $CopyWithPlaceholder() || sort == null
          ? _value.sort
          // ignore: cast_nullable_to_non_nullable
          : sort as Sort,
    );
  }
}

extension $ParamsDtoCopyWith on ParamsDto {
  /// Returns a callable class that can be used as follows: `instanceOfParamsDto.copyWith(...)` or like so:`instanceOfParamsDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ParamsDtoCWProxy get copyWith => _$ParamsDtoCWProxyImpl(this);
}

abstract class _$SortCWProxy {
  Sort field(String field);

  Sort order(Order order);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Sort(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Sort(...).copyWith(id: 12, name: "My name")
  /// ````
  Sort call({
    String? field,
    Order? order,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSort.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSort.copyWith.fieldName(...)`
class _$SortCWProxyImpl implements _$SortCWProxy {
  const _$SortCWProxyImpl(this._value);

  final Sort _value;

  @override
  Sort field(String field) => this(field: field);

  @override
  Sort order(Order order) => this(order: order);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Sort(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Sort(...).copyWith(id: 12, name: "My name")
  /// ````
  Sort call({
    Object? field = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
  }) {
    return Sort(
      field: field == const $CopyWithPlaceholder() || field == null
          ? _value.field
          // ignore: cast_nullable_to_non_nullable
          : field as String,
      order: order == const $CopyWithPlaceholder() || order == null
          ? _value.order
          // ignore: cast_nullable_to_non_nullable
          : order as Order,
    );
  }
}

extension $SortCopyWith on Sort {
  /// Returns a callable class that can be used as follows: `instanceOfSort.copyWith(...)` or like so:`instanceOfSort.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SortCWProxy get copyWith => _$SortCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamsDto _$ParamsDtoFromJson(Map<String, dynamic> json) => ParamsDto(
      page: json['page'] as int,
      limit: json['limit'] as int,
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParamsDtoToJson(ParamsDto instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'sort': instance.sort,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      field: json['field'] as String,
      order: $enumDecode(_$OrderEnumMap, json['order']),
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'field': instance.field,
      'order': _$OrderEnumMap[instance.order]!,
    };

const _$OrderEnumMap = {
  Order.asc: 'asc',
  Order.desc: 'desc',
};
