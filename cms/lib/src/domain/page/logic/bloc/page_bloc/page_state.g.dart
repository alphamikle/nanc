// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PageStateCWProxy {
  PageState controllerMap(Map<String, TextEditingController> controllerMap);

  PageState data(Map<String, dynamic> data);

  PageState initialData(Map<String, dynamic> initialData);

  PageState isDeleting(bool isDeleting);

  PageState isLoading(bool isLoading);

  PageState isSaving(bool isSaving);

  PageState thirdTable(ThirdTable thirdTable);

  PageState thirdTableData(
      Map<String, Map<String, List<String>>> thirdTableData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageState(...).copyWith(id: 12, name: "My name")
  /// ````
  PageState call({
    Map<String, TextEditingController>? controllerMap,
    Map<String, dynamic>? data,
    Map<String, dynamic>? initialData,
    bool? isDeleting,
    bool? isLoading,
    bool? isSaving,
    ThirdTable? thirdTable,
    Map<String, Map<String, List<String>>>? thirdTableData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPageState.copyWith.fieldName(...)`
class _$PageStateCWProxyImpl implements _$PageStateCWProxy {
  final PageState _value;

  const _$PageStateCWProxyImpl(this._value);

  @override
  PageState controllerMap(Map<String, TextEditingController> controllerMap) =>
      this(controllerMap: controllerMap);

  @override
  PageState data(Map<String, dynamic> data) => this(data: data);

  @override
  PageState initialData(Map<String, dynamic> initialData) =>
      this(initialData: initialData);

  @override
  PageState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  PageState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  PageState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  PageState thirdTable(ThirdTable thirdTable) => this(thirdTable: thirdTable);

  @override
  PageState thirdTableData(
          Map<String, Map<String, List<String>>> thirdTableData) =>
      this(thirdTableData: thirdTableData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageState(...).copyWith(id: 12, name: "My name")
  /// ````
  PageState call({
    Object? controllerMap = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? initialData = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
    Object? thirdTable = const $CopyWithPlaceholder(),
    Object? thirdTableData = const $CopyWithPlaceholder(),
  }) {
    return PageState(
      controllerMap:
          controllerMap == const $CopyWithPlaceholder() || controllerMap == null
              ? _value.controllerMap
              // ignore: cast_nullable_to_non_nullable
              : controllerMap as Map<String, TextEditingController>,
      data: data == const $CopyWithPlaceholder() || data == null
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as Map<String, dynamic>,
      initialData:
          initialData == const $CopyWithPlaceholder() || initialData == null
              ? _value.initialData
              // ignore: cast_nullable_to_non_nullable
              : initialData as Map<String, dynamic>,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      isSaving: isSaving == const $CopyWithPlaceholder() || isSaving == null
          ? _value.isSaving
          // ignore: cast_nullable_to_non_nullable
          : isSaving as bool,
      thirdTable:
          thirdTable == const $CopyWithPlaceholder() || thirdTable == null
              ? _value.thirdTable
              // ignore: cast_nullable_to_non_nullable
              : thirdTable as ThirdTable,
      thirdTableData: thirdTableData == const $CopyWithPlaceholder() ||
              thirdTableData == null
          ? _value.thirdTableData
          // ignore: cast_nullable_to_non_nullable
          : thirdTableData as Map<String, Map<String, List<String>>>,
    );
  }
}

extension $PageStateCopyWith on PageState {
  /// Returns a callable class that can be used as follows: `instanceOfPageState.copyWith(...)` or like so:`instanceOfPageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PageStateCWProxy get copyWith => _$PageStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageState _$PageStateFromJson(Map<String, dynamic> json) => PageState(
      data: json['data'] as Map<String, dynamic>,
      initialData: json['initialData'] as Map<String, dynamic>,
      isLoading: json['isLoading'] as bool,
      isDeleting: json['isDeleting'] as bool,
      isSaving: json['isSaving'] as bool,
      controllerMap: _controllerMapFromJson(
          json['controllerMap'] as Map<String, dynamic>?),
      thirdTable: ThirdTable.fromJson(json['thirdTable']),
      thirdTableData: (json['thirdTableData'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  k, (e as List<dynamic>).map((e) => e as String).toList()),
            )),
      ),
    );

Map<String, dynamic> _$PageStateToJson(PageState instance) => <String, dynamic>{
      'data': instance.data,
      'initialData': instance.initialData,
      'isLoading': instance.isLoading,
      'isSaving': instance.isSaving,
      'isDeleting': instance.isDeleting,
      'controllerMap': _controllerMapToJson(instance.controllerMap),
      'thirdTableData': instance.thirdTableData,
      'thirdTable': instance.thirdTable.toJson(),
    };
