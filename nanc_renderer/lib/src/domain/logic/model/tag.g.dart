// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$TagsContainerAutoequal on TagsContainer {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [nodes];
}

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

abstract class _$TagsContainerCWProxy {
  TagsContainer nodes(List<TagNode> nodes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TagsContainer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TagsContainer(...).copyWith(id: 12, name: "My name")
  /// ````
  TagsContainer call({
    List<TagNode>? nodes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTagsContainer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTagsContainer.copyWith.fieldName(...)`
class _$TagsContainerCWProxyImpl implements _$TagsContainerCWProxy {
  const _$TagsContainerCWProxyImpl(this._value);

  final TagsContainer _value;

  @override
  TagsContainer nodes(List<TagNode> nodes) => this(nodes: nodes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TagsContainer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TagsContainer(...).copyWith(id: 12, name: "My name")
  /// ````
  TagsContainer call({
    Object? nodes = const $CopyWithPlaceholder(),
  }) {
    return TagsContainer(
      nodes: nodes == const $CopyWithPlaceholder() || nodes == null
          ? _value.nodes
          // ignore: cast_nullable_to_non_nullable
          : nodes as List<TagNode>,
    );
  }
}

extension $TagsContainerCopyWith on TagsContainer {
  /// Returns a callable class that can be used as follows: `instanceOfTagsContainer.copyWith(...)` or like so:`instanceOfTagsContainer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TagsContainerCWProxy get copyWith => _$TagsContainerCWProxyImpl(this);
}

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

TagsContainer _$TagsContainerFromJson(Map<String, dynamic> json) =>
    TagsContainer(
      nodes: listOfTagNodesFromJson(json['nodes']),
    );

Map<String, dynamic> _$TagsContainerToJson(TagsContainer instance) =>
    <String, dynamic>{
      'nodes': listOfTagNodesToJson(instance.nodes),
    };

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

// **************************************************************************
// ProtoMapperGenerator
// **************************************************************************

class $TagNodeProtoMapper implements ProtoMapper<TagNode, GTagNode> {
  const $TagNodeProtoMapper();

  @override
  TagNode fromProto(GTagNode proto) => _$TagNodeFromProto(proto);

  @override
  GTagNode toProto(TagNode entity) => _$TagNodeToProto(entity);

  GFieldsOfTagNode toFieldsOfProto(TagNode entity) =>
      _$TagNodeToFieldsOfProto(entity);

  TagNode fromJson(String json) => _$TagNodeFromProto(GTagNode.fromJson(json));
  String toJson(TagNode entity) => _$TagNodeToProto(entity).writeToJson();

  String toBase64Proto(TagNode entity) =>
      base64Encode(utf8.encode(entity.toProto().writeToJson()));

  TagNode fromBase64Proto(String base64Proto) =>
      GTagNode.fromJson(utf8.decode(base64Decode(base64Proto))).toTagNode();
}

GFieldsOfTagNode _$TagNodeToFieldsOfProto(TagNode instance) {
  final proto = GFieldsOfTagNode();

  proto.type = GTagNodeType.valueOf(instance.type.index)!;

  return proto;
}

GTagNode _$TagNodeToProto(TagNode instance) {
  var proto = GTagNode();

  if (instance is WidgetTag) {
    proto.widgetTag = (const $WidgetTagProtoMapper()).toProto(instance);
    return proto;
  }

  if (instance is PropertyTag) {
    proto.propertyTag = (const $PropertyTagProtoMapper()).toProto(instance);
    return proto;
  }

  if (instance is TextNode) {
    proto.textNode = (const $TextNodeProtoMapper()).toProto(instance);
    return proto;
  }

  if (instance is UnknownNode) {
    proto.unknownNode = (const $UnknownNodeProtoMapper()).toProto(instance);
    return proto;
  }

  proto.tagNode = _$TagNodeToFieldsOfProto(instance);

  return proto;
}

TagNode _$TagNodeFromProto(GTagNode sInstance) {
  if (sInstance.hasWidgetTag()) {
    return sInstance.widgetTag.toWidgetTag();
  }

  if (sInstance.hasPropertyTag()) {
    return sInstance.propertyTag.toPropertyTag();
  }

  if (sInstance.hasTextNode()) {
    return sInstance.textNode.toTextNode();
  }

  if (sInstance.hasUnknownNode()) {
    return sInstance.unknownNode.toUnknownNode();
  }

  throw UnimplementedError();
}

extension $TagNodeProtoExtension on TagNode {
  GTagNode toProto() => _$TagNodeToProto(this);
  String toJson() => _$TagNodeToProto(this).writeToJson();

  static TagNode fromProto(GTagNode proto) => _$TagNodeFromProto(proto);
  static TagNode fromJson(String json) =>
      _$TagNodeFromProto(GTagNode.fromJson(json));
}

extension $GTagNodeProtoExtension on GTagNode {
  TagNode toTagNode() => _$TagNodeFromProto(this);
}

class $TagsContainerProtoMapper
    implements ProtoMapper<TagsContainer, GTagsContainer> {
  const $TagsContainerProtoMapper();

  @override
  TagsContainer fromProto(GTagsContainer proto) =>
      _$TagsContainerFromProto(proto);

  @override
  GTagsContainer toProto(TagsContainer entity) =>
      _$TagsContainerToProto(entity);

  GTagsContainer toFieldsOfProto(TagsContainer entity) =>
      _$TagsContainerToProto(entity);

  TagsContainer fromJson(String json) =>
      _$TagsContainerFromProto(GTagsContainer.fromJson(json));
  String toJson(TagsContainer entity) =>
      _$TagsContainerToProto(entity).writeToJson();

  String toBase64Proto(TagsContainer entity) =>
      base64Encode(utf8.encode(entity.toProto().writeToJson()));

  TagsContainer fromBase64Proto(String base64Proto) =>
      GTagsContainer.fromJson(utf8.decode(base64Decode(base64Proto)))
          .toTagsContainer();
}

GTagsContainer _$TagsContainerToProto(TagsContainer instance) {
  var proto = GTagsContainer();

  proto.nodes.addAll(
      instance.nodes.map((e) => const $TagNodeProtoMapper().toProto(e)));

  return proto;
}

TagsContainer _$TagsContainerFromProto(GTagsContainer proto) {
  return TagsContainer(
    nodes: List<TagNode>.unmodifiable(
        proto.nodes.map((e) => const $TagNodeProtoMapper().fromProto(e))),
  );
}

extension $TagsContainerProtoExtension on TagsContainer {
  GTagsContainer toProto() => _$TagsContainerToProto(this);
  String toJson() => _$TagsContainerToProto(this).writeToJson();

  static TagsContainer fromProto(GTagsContainer proto) =>
      _$TagsContainerFromProto(proto);
  static TagsContainer fromJson(String json) =>
      _$TagsContainerFromProto(GTagsContainer.fromJson(json));
}

extension $GTagsContainerProtoExtension on GTagsContainer {
  TagsContainer toTagsContainer() => _$TagsContainerFromProto(this);
}

class $WidgetTagProtoMapper implements ProtoMapper<WidgetTag, GWidgetTag> {
  const $WidgetTagProtoMapper();

  @override
  WidgetTag fromProto(GWidgetTag proto) => _$WidgetTagFromProto(proto);

  @override
  GWidgetTag toProto(WidgetTag entity) => _$WidgetTagToProto(entity);

  GWidgetTag toFieldsOfProto(WidgetTag entity) => _$WidgetTagToProto(entity);

  WidgetTag fromJson(String json) =>
      _$WidgetTagFromProto(GWidgetTag.fromJson(json));
  String toJson(WidgetTag entity) => _$WidgetTagToProto(entity).writeToJson();

  String toBase64Proto(WidgetTag entity) =>
      base64Encode(utf8.encode(entity.toProto().writeToJson()));

  WidgetTag fromBase64Proto(String base64Proto) =>
      GWidgetTag.fromJson(utf8.decode(base64Decode(base64Proto))).toWidgetTag();
}

GWidgetTag _$WidgetTagToProto(WidgetTag instance) {
  var proto = GWidgetTag();

  proto.type = GTagNodeType.valueOf(instance.type.index)!;
  proto.tag = instance.tag;
  proto.children.addAll(
      instance.children.map((e) => const $TagNodeProtoMapper().toProto(e)));

  proto.attributes.addAll(instance.attributes.map((k, v) => MapEntry(k, v)));

  return proto;
}

WidgetTag _$WidgetTagFromProto(GWidgetTag proto) {
  return WidgetTag(
    tag: proto.tag,
    children: List<TagNode>.unmodifiable(
        proto.children.map((e) => const $TagNodeProtoMapper().fromProto(e))),
    attributes: proto.attributes.map((k, v) => MapEntry(k, v)),
    type: TagNodeType.values[proto.type.value],
  );
}

extension $WidgetTagProtoExtension on WidgetTag {
  GWidgetTag toProto() => _$WidgetTagToProto(this);
  String toJson() => _$WidgetTagToProto(this).writeToJson();

  static WidgetTag fromProto(GWidgetTag proto) => _$WidgetTagFromProto(proto);
  static WidgetTag fromJson(String json) =>
      _$WidgetTagFromProto(GWidgetTag.fromJson(json));
}

extension $GWidgetTagProtoExtension on GWidgetTag {
  WidgetTag toWidgetTag() => _$WidgetTagFromProto(this);
}

class $PropertyTagProtoMapper
    implements ProtoMapper<PropertyTag, GPropertyTag> {
  const $PropertyTagProtoMapper();

  @override
  PropertyTag fromProto(GPropertyTag proto) => _$PropertyTagFromProto(proto);

  @override
  GPropertyTag toProto(PropertyTag entity) => _$PropertyTagToProto(entity);

  GPropertyTag toFieldsOfProto(PropertyTag entity) =>
      _$PropertyTagToProto(entity);

  PropertyTag fromJson(String json) =>
      _$PropertyTagFromProto(GPropertyTag.fromJson(json));
  String toJson(PropertyTag entity) =>
      _$PropertyTagToProto(entity).writeToJson();

  String toBase64Proto(PropertyTag entity) =>
      base64Encode(utf8.encode(entity.toProto().writeToJson()));

  PropertyTag fromBase64Proto(String base64Proto) =>
      GPropertyTag.fromJson(utf8.decode(base64Decode(base64Proto)))
          .toPropertyTag();
}

GPropertyTag _$PropertyTagToProto(PropertyTag instance) {
  var proto = GPropertyTag();

  proto.type = GTagNodeType.valueOf(instance.type.index)!;
  proto.tag = instance.tag;
  proto.children.addAll(
      instance.children.map((e) => const $TagNodeProtoMapper().toProto(e)));

  proto.attributes.addAll(instance.attributes.map((k, v) => MapEntry(k, v)));

  return proto;
}

PropertyTag _$PropertyTagFromProto(GPropertyTag proto) {
  return PropertyTag(
    tag: proto.tag,
    children: List<TagNode>.unmodifiable(
        proto.children.map((e) => const $TagNodeProtoMapper().fromProto(e))),
    attributes: proto.attributes.map((k, v) => MapEntry(k, v)),
    type: TagNodeType.values[proto.type.value],
  );
}

extension $PropertyTagProtoExtension on PropertyTag {
  GPropertyTag toProto() => _$PropertyTagToProto(this);
  String toJson() => _$PropertyTagToProto(this).writeToJson();

  static PropertyTag fromProto(GPropertyTag proto) =>
      _$PropertyTagFromProto(proto);
  static PropertyTag fromJson(String json) =>
      _$PropertyTagFromProto(GPropertyTag.fromJson(json));
}

extension $GPropertyTagProtoExtension on GPropertyTag {
  PropertyTag toPropertyTag() => _$PropertyTagFromProto(this);
}

class $TextNodeProtoMapper implements ProtoMapper<TextNode, GTextNode> {
  const $TextNodeProtoMapper();

  @override
  TextNode fromProto(GTextNode proto) => _$TextNodeFromProto(proto);

  @override
  GTextNode toProto(TextNode entity) => _$TextNodeToProto(entity);

  GTextNode toFieldsOfProto(TextNode entity) => _$TextNodeToProto(entity);

  TextNode fromJson(String json) =>
      _$TextNodeFromProto(GTextNode.fromJson(json));
  String toJson(TextNode entity) => _$TextNodeToProto(entity).writeToJson();

  String toBase64Proto(TextNode entity) =>
      base64Encode(utf8.encode(entity.toProto().writeToJson()));

  TextNode fromBase64Proto(String base64Proto) =>
      GTextNode.fromJson(utf8.decode(base64Decode(base64Proto))).toTextNode();
}

GTextNode _$TextNodeToProto(TextNode instance) {
  var proto = GTextNode();

  proto.type = GTagNodeType.valueOf(instance.type.index)!;
  proto.text = instance.text;

  return proto;
}

TextNode _$TextNodeFromProto(GTextNode proto) {
  return TextNode(
    text: proto.text,
    type: TagNodeType.values[proto.type.value],
  );
}

extension $TextNodeProtoExtension on TextNode {
  GTextNode toProto() => _$TextNodeToProto(this);
  String toJson() => _$TextNodeToProto(this).writeToJson();

  static TextNode fromProto(GTextNode proto) => _$TextNodeFromProto(proto);
  static TextNode fromJson(String json) =>
      _$TextNodeFromProto(GTextNode.fromJson(json));
}

extension $GTextNodeProtoExtension on GTextNode {
  TextNode toTextNode() => _$TextNodeFromProto(this);
}

class $UnknownNodeProtoMapper
    implements ProtoMapper<UnknownNode, GUnknownNode> {
  const $UnknownNodeProtoMapper();

  @override
  UnknownNode fromProto(GUnknownNode proto) => _$UnknownNodeFromProto(proto);

  @override
  GUnknownNode toProto(UnknownNode entity) => _$UnknownNodeToProto(entity);

  GUnknownNode toFieldsOfProto(UnknownNode entity) =>
      _$UnknownNodeToProto(entity);

  UnknownNode fromJson(String json) =>
      _$UnknownNodeFromProto(GUnknownNode.fromJson(json));
  String toJson(UnknownNode entity) =>
      _$UnknownNodeToProto(entity).writeToJson();

  String toBase64Proto(UnknownNode entity) =>
      base64Encode(utf8.encode(entity.toProto().writeToJson()));

  UnknownNode fromBase64Proto(String base64Proto) =>
      GUnknownNode.fromJson(utf8.decode(base64Decode(base64Proto)))
          .toUnknownNode();
}

GUnknownNode _$UnknownNodeToProto(UnknownNode instance) {
  var proto = GUnknownNode();

  proto.type = GTagNodeType.valueOf(instance.type.index)!;
  proto.text = instance.text;

  return proto;
}

UnknownNode _$UnknownNodeFromProto(GUnknownNode proto) {
  return UnknownNode(
    text: proto.text,
    type: TagNodeType.values[proto.type.value],
  );
}

extension $UnknownNodeProtoExtension on UnknownNode {
  GUnknownNode toProto() => _$UnknownNodeToProto(this);
  String toJson() => _$UnknownNodeToProto(this).writeToJson();

  static UnknownNode fromProto(GUnknownNode proto) =>
      _$UnknownNodeFromProto(proto);
  static UnknownNode fromJson(String json) =>
      _$UnknownNodeFromProto(GUnknownNode.fromJson(json));
}

extension $GUnknownNodeProtoExtension on GUnknownNode {
  UnknownNode toUnknownNode() => _$UnknownNodeFromProto(this);
}

class $TagNodeTypeProtoMapper
    implements ProtoMapper<TagNodeType, GTagNodeType> {
  const $TagNodeTypeProtoMapper();

  @override
  TagNodeType fromProto(GTagNodeType proto) => TagNodeType.values[proto.value];

  @override
  GTagNodeType toProto(TagNodeType entity) =>
      GTagNodeType.valueOf(entity.index)!;
}

extension $GTagNodeTypeProtoExtension on GTagNodeType {
  TagNodeType toTagNodeType() =>
      const $TagNodeTypeProtoMapper().fromProto(this);
}
