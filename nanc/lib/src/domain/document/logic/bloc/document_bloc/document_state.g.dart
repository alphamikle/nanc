// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$DocumentStateAutoequal on DocumentState {
  List<Object?> get _$props => [
        thirdTableData,
        thirdTable,
        data,
        initialData,
        isLoading,
        isSaving,
        isError,
        isDeleting,
        controllerMap,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DocumentStateCWProxy {
  DocumentState data(Map<String, dynamic> data);

  DocumentState initialData(Map<String, dynamic> initialData);

  DocumentState isLoading(bool isLoading);

  DocumentState isDeleting(bool isDeleting);

  DocumentState isSaving(bool isSaving);

  DocumentState controllerMap(Map<String, TextEditingController> controllerMap);

  DocumentState isError(bool isError);

  DocumentState thirdTable(Map<String, ThirdTable> thirdTable);

  DocumentState thirdTableData(
      Map<String, Map<String, List<String>>> thirdTableData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DocumentState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DocumentState(...).copyWith(id: 12, name: "My name")
  /// ````
  DocumentState call({
    Map<String, dynamic>? data,
    Map<String, dynamic>? initialData,
    bool? isLoading,
    bool? isDeleting,
    bool? isSaving,
    Map<String, TextEditingController>? controllerMap,
    bool? isError,
    Map<String, ThirdTable>? thirdTable,
    Map<String, Map<String, List<String>>>? thirdTableData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDocumentState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDocumentState.copyWith.fieldName(...)`
class _$DocumentStateCWProxyImpl implements _$DocumentStateCWProxy {
  const _$DocumentStateCWProxyImpl(this._value);

  final DocumentState _value;

  @override
  DocumentState data(Map<String, dynamic> data) => this(data: data);

  @override
  DocumentState initialData(Map<String, dynamic> initialData) =>
      this(initialData: initialData);

  @override
  DocumentState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  DocumentState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  DocumentState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  DocumentState controllerMap(
          Map<String, TextEditingController> controllerMap) =>
      this(controllerMap: controllerMap);

  @override
  DocumentState isError(bool isError) => this(isError: isError);

  @override
  DocumentState thirdTable(Map<String, ThirdTable> thirdTable) =>
      this(thirdTable: thirdTable);

  @override
  DocumentState thirdTableData(
          Map<String, Map<String, List<String>>> thirdTableData) =>
      this(thirdTableData: thirdTableData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DocumentState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DocumentState(...).copyWith(id: 12, name: "My name")
  /// ````
  DocumentState call({
    Object? data = const $CopyWithPlaceholder(),
    Object? initialData = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
    Object? controllerMap = const $CopyWithPlaceholder(),
    Object? isError = const $CopyWithPlaceholder(),
    Object? thirdTable = const $CopyWithPlaceholder(),
    Object? thirdTableData = const $CopyWithPlaceholder(),
  }) {
    return DocumentState(
      data: data == const $CopyWithPlaceholder() || data == null
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as Map<String, dynamic>,
      initialData:
          initialData == const $CopyWithPlaceholder() || initialData == null
              ? _value.initialData
              // ignore: cast_nullable_to_non_nullable
              : initialData as Map<String, dynamic>,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      isSaving: isSaving == const $CopyWithPlaceholder() || isSaving == null
          ? _value.isSaving
          // ignore: cast_nullable_to_non_nullable
          : isSaving as bool,
      controllerMap:
          controllerMap == const $CopyWithPlaceholder() || controllerMap == null
              ? _value.controllerMap
              // ignore: cast_nullable_to_non_nullable
              : controllerMap as Map<String, TextEditingController>,
      isError: isError == const $CopyWithPlaceholder() || isError == null
          ? _value.isError
          // ignore: cast_nullable_to_non_nullable
          : isError as bool,
      thirdTable:
          thirdTable == const $CopyWithPlaceholder() || thirdTable == null
              ? _value.thirdTable
              // ignore: cast_nullable_to_non_nullable
              : thirdTable as Map<String, ThirdTable>,
      thirdTableData: thirdTableData == const $CopyWithPlaceholder() ||
              thirdTableData == null
          ? _value.thirdTableData
          // ignore: cast_nullable_to_non_nullable
          : thirdTableData as Map<String, Map<String, List<String>>>,
    );
  }
}

extension $DocumentStateCopyWith on DocumentState {
  /// Returns a callable class that can be used as follows: `instanceOfDocumentState.copyWith(...)` or like so:`instanceOfDocumentState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DocumentStateCWProxy get copyWith => _$DocumentStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentState _$DocumentStateFromJson(Map<String, dynamic> json) =>
    DocumentState(
      data: json['data'] as Map<String, dynamic>,
      initialData: json['initialData'] as Map<String, dynamic>,
      isLoading: json['isLoading'] as bool,
      isDeleting: json['isDeleting'] as bool,
      isSaving: json['isSaving'] as bool,
      controllerMap: _controllerMapFromJson(
          json['controllerMap'] as Map<String, dynamic>?),
      isError: json['isError'] as bool,
      thirdTable: (json['thirdTable'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ThirdTable.fromJson(e)),
      ),
      thirdTableData: (json['thirdTableData'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  k, (e as List<dynamic>).map((e) => e as String).toList()),
            )),
      ),
    );

Map<String, dynamic> _$DocumentStateToJson(DocumentState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'initialData': instance.initialData,
      'isLoading': instance.isLoading,
      'isSaving': instance.isSaving,
      'isError': instance.isError,
      'isDeleting': instance.isDeleting,
      'controllerMap': _controllerMapToJson(instance.controllerMap),
      'thirdTableData': instance.thirdTableData,
      'thirdTable': instance.thirdTable.map((k, e) => MapEntry(k, e.toJson())),
    };
