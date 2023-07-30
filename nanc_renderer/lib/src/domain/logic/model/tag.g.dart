// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$WidgetTagAutoequal on WidgetTag {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [type, tag, children, attributes];
}

extension _$PropertyTagAutoequal on PropertyTag {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [type, tag, children, attributes];
}

extension _$TextNodeAutoequal on TextNode {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [type, text];
}

extension _$UnknownNodeAutoequal on UnknownNode {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [type, text];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WidgetTagCWProxy {
  WidgetTag tag(String tag);

  WidgetTag children(List<TagNode> children);

  WidgetTag attributes(Map<String, String> attributes);

  WidgetTag type(TagNodeType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WidgetTag(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WidgetTag(...).copyWith(id: 12, name: "My name")
  /// ````
  WidgetTag call({
    String? tag,
    List<TagNode>? children,
    Map<String, String>? attributes,
    TagNodeType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWidgetTag.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWidgetTag.copyWith.fieldName(...)`
class _$WidgetTagCWProxyImpl implements _$WidgetTagCWProxy {
  const _$WidgetTagCWProxyImpl(this._value);

  final WidgetTag _value;

  @override
  WidgetTag tag(String tag) => this(tag: tag);

  @override
  WidgetTag children(List<TagNode> children) => this(children: children);

  @override
  WidgetTag attributes(Map<String, String> attributes) =>
      this(attributes: attributes);

  @override
  WidgetTag type(TagNodeType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WidgetTag(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WidgetTag(...).copyWith(id: 12, name: "My name")
  /// ````
  WidgetTag call({
    Object? tag = const $CopyWithPlaceholder(),
    Object? children = const $CopyWithPlaceholder(),
    Object? attributes = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return WidgetTag(
      tag: tag == const $CopyWithPlaceholder() || tag == null
          ? _value.tag
          // ignore: cast_nullable_to_non_nullable
          : tag as String,
      children: children == const $CopyWithPlaceholder() || children == null
          ? _value.children
          // ignore: cast_nullable_to_non_nullable
          : children as List<TagNode>,
      attributes:
          attributes == const $CopyWithPlaceholder() || attributes == null
              ? _value.attributes
              // ignore: cast_nullable_to_non_nullable
              : attributes as Map<String, String>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TagNodeType,
    );
  }
}

extension $WidgetTagCopyWith on WidgetTag {
  /// Returns a callable class that can be used as follows: `instanceOfWidgetTag.copyWith(...)` or like so:`instanceOfWidgetTag.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WidgetTagCWProxy get copyWith => _$WidgetTagCWProxyImpl(this);
}

abstract class _$PropertyTagCWProxy {
  PropertyTag tag(String tag);

  PropertyTag children(List<TagNode> children);

  PropertyTag attributes(Map<String, String> attributes);

  PropertyTag type(TagNodeType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PropertyTag(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PropertyTag(...).copyWith(id: 12, name: "My name")
  /// ````
  PropertyTag call({
    String? tag,
    List<TagNode>? children,
    Map<String, String>? attributes,
    TagNodeType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPropertyTag.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPropertyTag.copyWith.fieldName(...)`
class _$PropertyTagCWProxyImpl implements _$PropertyTagCWProxy {
  const _$PropertyTagCWProxyImpl(this._value);

  final PropertyTag _value;

  @override
  PropertyTag tag(String tag) => this(tag: tag);

  @override
  PropertyTag children(List<TagNode> children) => this(children: children);

  @override
  PropertyTag attributes(Map<String, String> attributes) =>
      this(attributes: attributes);

  @override
  PropertyTag type(TagNodeType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PropertyTag(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PropertyTag(...).copyWith(id: 12, name: "My name")
  /// ````
  PropertyTag call({
    Object? tag = const $CopyWithPlaceholder(),
    Object? children = const $CopyWithPlaceholder(),
    Object? attributes = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return PropertyTag(
      tag: tag == const $CopyWithPlaceholder() || tag == null
          ? _value.tag
          // ignore: cast_nullable_to_non_nullable
          : tag as String,
      children: children == const $CopyWithPlaceholder() || children == null
          ? _value.children
          // ignore: cast_nullable_to_non_nullable
          : children as List<TagNode>,
      attributes:
          attributes == const $CopyWithPlaceholder() || attributes == null
              ? _value.attributes
              // ignore: cast_nullable_to_non_nullable
              : attributes as Map<String, String>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TagNodeType,
    );
  }
}

extension $PropertyTagCopyWith on PropertyTag {
  /// Returns a callable class that can be used as follows: `instanceOfPropertyTag.copyWith(...)` or like so:`instanceOfPropertyTag.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PropertyTagCWProxy get copyWith => _$PropertyTagCWProxyImpl(this);
}

abstract class _$TextNodeCWProxy {
  TextNode text(String text);

  TextNode type(TagNodeType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TextNode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TextNode(...).copyWith(id: 12, name: "My name")
  /// ````
  TextNode call({
    String? text,
    TagNodeType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTextNode.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTextNode.copyWith.fieldName(...)`
class _$TextNodeCWProxyImpl implements _$TextNodeCWProxy {
  const _$TextNodeCWProxyImpl(this._value);

  final TextNode _value;

  @override
  TextNode text(String text) => this(text: text);

  @override
  TextNode type(TagNodeType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TextNode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TextNode(...).copyWith(id: 12, name: "My name")
  /// ````
  TextNode call({
    Object? text = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return TextNode(
      text: text == const $CopyWithPlaceholder() || text == null
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TagNodeType,
    );
  }
}

extension $TextNodeCopyWith on TextNode {
  /// Returns a callable class that can be used as follows: `instanceOfTextNode.copyWith(...)` or like so:`instanceOfTextNode.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TextNodeCWProxy get copyWith => _$TextNodeCWProxyImpl(this);
}

abstract class _$UnknownNodeCWProxy {
  UnknownNode text(String text);

  UnknownNode type(TagNodeType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnknownNode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnknownNode(...).copyWith(id: 12, name: "My name")
  /// ````
  UnknownNode call({
    String? text,
    TagNodeType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnknownNode.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnknownNode.copyWith.fieldName(...)`
class _$UnknownNodeCWProxyImpl implements _$UnknownNodeCWProxy {
  const _$UnknownNodeCWProxyImpl(this._value);

  final UnknownNode _value;

  @override
  UnknownNode text(String text) => this(text: text);

  @override
  UnknownNode type(TagNodeType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnknownNode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnknownNode(...).copyWith(id: 12, name: "My name")
  /// ````
  UnknownNode call({
    Object? text = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return UnknownNode(
      text: text == const $CopyWithPlaceholder() || text == null
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TagNodeType,
    );
  }
}

extension $UnknownNodeCopyWith on UnknownNode {
  /// Returns a callable class that can be used as follows: `instanceOfUnknownNode.copyWith(...)` or like so:`instanceOfUnknownNode.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnknownNodeCWProxy get copyWith => _$UnknownNodeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetTag _$WidgetTagFromJson(Map<String, dynamic> json) => WidgetTag(
      tag: json['tag'] as String,
      children: listOfTagNodesFromJson(json['children']),
      attributes: Map<String, String>.from(json['attributes'] as Map),
      type: $enumDecodeNullable(_$TagNodeTypeEnumMap, json['type']) ??
          TagNodeType.widget,
    );

Map<String, dynamic> _$WidgetTagToJson(WidgetTag instance) => <String, dynamic>{
      'type': _$TagNodeTypeEnumMap[instance.type]!,
      'tag': instance.tag,
      'children': listOfTagNodesToJson(instance.children),
      'attributes': instance.attributes,
    };

const _$TagNodeTypeEnumMap = {
  TagNodeType.widget: 'widget',
  TagNodeType.property: 'property',
  TagNodeType.text: 'text',
  TagNodeType.unknown: 'unknown',
};

PropertyTag _$PropertyTagFromJson(Map<String, dynamic> json) => PropertyTag(
      tag: json['tag'] as String,
      children: listOfTagNodesFromJson(json['children']),
      attributes: Map<String, String>.from(json['attributes'] as Map),
      type: $enumDecodeNullable(_$TagNodeTypeEnumMap, json['type']) ??
          TagNodeType.property,
    );

Map<String, dynamic> _$PropertyTagToJson(PropertyTag instance) =>
    <String, dynamic>{
      'type': _$TagNodeTypeEnumMap[instance.type]!,
      'tag': instance.tag,
      'children': listOfTagNodesToJson(instance.children),
      'attributes': instance.attributes,
    };

TextNode _$TextNodeFromJson(Map<String, dynamic> json) => TextNode(
      text: json['text'] as String,
      type: $enumDecodeNullable(_$TagNodeTypeEnumMap, json['type']) ??
          TagNodeType.text,
    );

Map<String, dynamic> _$TextNodeToJson(TextNode instance) => <String, dynamic>{
      'type': _$TagNodeTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

UnknownNode _$UnknownNodeFromJson(Map<String, dynamic> json) => UnknownNode(
      text: json['text'] as String,
      type: $enumDecodeNullable(_$TagNodeTypeEnumMap, json['type']) ??
          TagNodeType.text,
    );

Map<String, dynamic> _$UnknownNodeToJson(UnknownNode instance) =>
    <String, dynamic>{
      'type': _$TagNodeTypeEnumMap[instance.type]!,
      'text': instance.text,
    };
