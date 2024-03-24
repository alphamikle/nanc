// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ModelAutoequal on Model {
  List<Object?> get _$props => [
        id,
        name,
        icon,
        isCollection,
        sort,
        showInMenu,
        fields,
        codeFirstEntity,
        isHybrid,
        flattenFields,
        listFields,
        idField,
        dynamicFields,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ModelCWProxy {
  Model name(String name);

  Model icon(String icon);

  Model fields(List<List<Field>> fields);

  Model isCollection(bool isCollection);

  Model sort(int sort);

  Model showInMenu(bool showInMenu);

  Model id(String? id);

  Model codeFirstEntity(bool codeFirstEntity);

  Model isHybrid(bool isHybrid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Model(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Model(...).copyWith(id: 12, name: "My name")
  /// ````
  Model call({
    String? name,
    String? icon,
    List<List<Field>>? fields,
    bool? isCollection,
    int? sort,
    bool? showInMenu,
    String? id,
    bool? codeFirstEntity,
    bool? isHybrid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfModel.copyWith.fieldName(...)`
class _$ModelCWProxyImpl implements _$ModelCWProxy {
  const _$ModelCWProxyImpl(this._value);

  final Model _value;

  @override
  Model name(String name) => this(name: name);

  @override
  Model icon(String icon) => this(icon: icon);

  @override
  Model fields(List<List<Field>> fields) => this(fields: fields);

  @override
  Model isCollection(bool isCollection) => this(isCollection: isCollection);

  @override
  Model sort(int sort) => this(sort: sort);

  @override
  Model showInMenu(bool showInMenu) => this(showInMenu: showInMenu);

  @override
  Model id(String? id) => this(id: id);

  @override
  Model codeFirstEntity(bool codeFirstEntity) =>
      this(codeFirstEntity: codeFirstEntity);

  @override
  Model isHybrid(bool isHybrid) => this(isHybrid: isHybrid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Model(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Model(...).copyWith(id: 12, name: "My name")
  /// ````
  Model call({
    Object? name = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? fields = const $CopyWithPlaceholder(),
    Object? isCollection = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? showInMenu = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? codeFirstEntity = const $CopyWithPlaceholder(),
    Object? isHybrid = const $CopyWithPlaceholder(),
  }) {
    return Model(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      icon: icon == const $CopyWithPlaceholder() || icon == null
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as String,
      fields: fields == const $CopyWithPlaceholder() || fields == null
          ? _value.fields
          // ignore: cast_nullable_to_non_nullable
          : fields as List<List<Field>>,
      isCollection:
          isCollection == const $CopyWithPlaceholder() || isCollection == null
              ? _value.isCollection
              // ignore: cast_nullable_to_non_nullable
              : isCollection as bool,
      sort: sort == const $CopyWithPlaceholder() || sort == null
          ? _value.sort
          // ignore: cast_nullable_to_non_nullable
          : sort as int,
      showInMenu:
          showInMenu == const $CopyWithPlaceholder() || showInMenu == null
              ? _value.showInMenu
              // ignore: cast_nullable_to_non_nullable
              : showInMenu as bool,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      codeFirstEntity: codeFirstEntity == const $CopyWithPlaceholder() ||
              codeFirstEntity == null
          ? _value.codeFirstEntity
          // ignore: cast_nullable_to_non_nullable
          : codeFirstEntity as bool,
      isHybrid: isHybrid == const $CopyWithPlaceholder() || isHybrid == null
          ? _value.isHybrid
          // ignore: cast_nullable_to_non_nullable
          : isHybrid as bool,
    );
  }
}

extension $ModelCopyWith on Model {
  /// Returns a callable class that can be used as follows: `instanceOfModel.copyWith(...)` or like so:`instanceOfModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ModelCWProxy get copyWith => _$ModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      name: json['name'] as String,
      icon: json['icon'] as String,
      fields: fieldsFromJson(json['fields'] as List),
      isCollection: json['isCollection'] as bool? ?? true,
      sort: json['sort'] as int? ?? 0,
      showInMenu: json['showInMenu'] as bool? ?? true,
      id: json['id'] as String?,
      codeFirstEntity: json['codeFirstEntity'] == null
          ? false
          : _codeFirstFlagFromJson(json['codeFirstEntity']),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'isCollection': instance.isCollection,
      'sort': instance.sort,
      'showInMenu': instance.showInMenu,
      'fields': fieldsToJson(instance.fields),
      'codeFirstEntity': _codeFirstFlagToJson(instance.codeFirstEntity),
    };
