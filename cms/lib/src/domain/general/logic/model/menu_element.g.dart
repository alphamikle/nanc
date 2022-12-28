// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_element.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MenuElementCWProxy {
  MenuElement title(String title);

  MenuElement url(String url);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuElement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuElement(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuElement call({
    String? title,
    String? url,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenuElement.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenuElement.copyWith.fieldName(...)`
class _$MenuElementCWProxyImpl implements _$MenuElementCWProxy {
  final MenuElement _value;

  const _$MenuElementCWProxyImpl(this._value);

  @override
  MenuElement title(String title) => this(title: title);

  @override
  MenuElement url(String url) => this(url: url);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuElement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuElement(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuElement call({
    Object? title = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
  }) {
    return MenuElement(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
    );
  }
}

extension $MenuElementCopyWith on MenuElement {
  /// Returns a callable class that can be used as follows: `instanceOfMenuElement.copyWith(...)` or like so:`instanceOfMenuElement.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuElementCWProxy get copyWith => _$MenuElementCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuElement _$MenuElementFromJson(Map<String, dynamic> json) => MenuElement(
      title: json['title'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$MenuElementToJson(MenuElement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
    };
