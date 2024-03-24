//
//  Generated code. Do not modify.
//  source: tags.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'tags.pbenum.dart';

export 'tags.pbenum.dart';

class GFieldsOfTagNode extends $pb.GeneratedMessage {
  factory GFieldsOfTagNode({
    GTagNodeType? type,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  GFieldsOfTagNode._() : super();
  factory GFieldsOfTagNode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GFieldsOfTagNode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GFieldsOfTagNode', package: const $pb.PackageName(_omitMessageNames ? '' : 'io.nanc.nanc'), createEmptyInstance: create)
    ..e<GTagNodeType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: GTagNodeType.G_TAG_NODE_TYPE_WIDGET, valueOf: GTagNodeType.valueOf, enumValues: GTagNodeType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GFieldsOfTagNode clone() => GFieldsOfTagNode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GFieldsOfTagNode copyWith(void Function(GFieldsOfTagNode) updates) => super.copyWith((message) => updates(message as GFieldsOfTagNode)) as GFieldsOfTagNode;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GFieldsOfTagNode create() => GFieldsOfTagNode._();
  GFieldsOfTagNode createEmptyInstance() => create();
  static $pb.PbList<GFieldsOfTagNode> createRepeated() => $pb.PbList<GFieldsOfTagNode>();
  @$core.pragma('dart2js:noInline')
  static GFieldsOfTagNode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GFieldsOfTagNode>(create);
  static GFieldsOfTagNode? _defaultInstance;

  @$pb.TagNumber(2)
  GTagNodeType get type => $_getN(0);
  @$pb.TagNumber(2)
  set type(GTagNodeType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

enum GTagNode_Props {
  tagNode, 
  widgetTag, 
  propertyTag, 
  textNode, 
  unknownNode, 
  notSet
}

class GTagNode extends $pb.GeneratedMessage {
  factory GTagNode({
    GFieldsOfTagNode? tagNode,
    GWidgetTag? widgetTag,
    GPropertyTag? propertyTag,
    GTextNode? textNode,
    GUnknownNode? unknownNode,
  }) {
    final $result = create();
    if (tagNode != null) {
      $result.tagNode = tagNode;
    }
    if (widgetTag != null) {
      $result.widgetTag = widgetTag;
    }
    if (propertyTag != null) {
      $result.propertyTag = propertyTag;
    }
    if (textNode != null) {
      $result.textNode = textNode;
    }
    if (unknownNode != null) {
      $result.unknownNode = unknownNode;
    }
    return $result;
  }
  GTagNode._() : super();
  factory GTagNode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GTagNode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, GTagNode_Props> _GTagNode_PropsByTag = {
    1 : GTagNode_Props.tagNode,
    2 : GTagNode_Props.widgetTag,
    3 : GTagNode_Props.propertyTag,
    4 : GTagNode_Props.textNode,
    5 : GTagNode_Props.unknownNode,
    0 : GTagNode_Props.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GTagNode', package: const $pb.PackageName(_omitMessageNames ? '' : 'io.nanc.nanc'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<GFieldsOfTagNode>(1, _omitFieldNames ? '' : 'tagNode', subBuilder: GFieldsOfTagNode.create)
    ..aOM<GWidgetTag>(2, _omitFieldNames ? '' : 'widgetTag', subBuilder: GWidgetTag.create)
    ..aOM<GPropertyTag>(3, _omitFieldNames ? '' : 'propertyTag', subBuilder: GPropertyTag.create)
    ..aOM<GTextNode>(4, _omitFieldNames ? '' : 'textNode', subBuilder: GTextNode.create)
    ..aOM<GUnknownNode>(5, _omitFieldNames ? '' : 'unknownNode', subBuilder: GUnknownNode.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GTagNode clone() => GTagNode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GTagNode copyWith(void Function(GTagNode) updates) => super.copyWith((message) => updates(message as GTagNode)) as GTagNode;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GTagNode create() => GTagNode._();
  GTagNode createEmptyInstance() => create();
  static $pb.PbList<GTagNode> createRepeated() => $pb.PbList<GTagNode>();
  @$core.pragma('dart2js:noInline')
  static GTagNode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GTagNode>(create);
  static GTagNode? _defaultInstance;

  GTagNode_Props whichProps() => _GTagNode_PropsByTag[$_whichOneof(0)]!;
  void clearProps() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GFieldsOfTagNode get tagNode => $_getN(0);
  @$pb.TagNumber(1)
  set tagNode(GFieldsOfTagNode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagNode() => clearField(1);
  @$pb.TagNumber(1)
  GFieldsOfTagNode ensureTagNode() => $_ensure(0);

  @$pb.TagNumber(2)
  GWidgetTag get widgetTag => $_getN(1);
  @$pb.TagNumber(2)
  set widgetTag(GWidgetTag v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasWidgetTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidgetTag() => clearField(2);
  @$pb.TagNumber(2)
  GWidgetTag ensureWidgetTag() => $_ensure(1);

  @$pb.TagNumber(3)
  GPropertyTag get propertyTag => $_getN(2);
  @$pb.TagNumber(3)
  set propertyTag(GPropertyTag v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPropertyTag() => $_has(2);
  @$pb.TagNumber(3)
  void clearPropertyTag() => clearField(3);
  @$pb.TagNumber(3)
  GPropertyTag ensurePropertyTag() => $_ensure(2);

  @$pb.TagNumber(4)
  GTextNode get textNode => $_getN(3);
  @$pb.TagNumber(4)
  set textNode(GTextNode v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTextNode() => $_has(3);
  @$pb.TagNumber(4)
  void clearTextNode() => clearField(4);
  @$pb.TagNumber(4)
  GTextNode ensureTextNode() => $_ensure(3);

  @$pb.TagNumber(5)
  GUnknownNode get unknownNode => $_getN(4);
  @$pb.TagNumber(5)
  set unknownNode(GUnknownNode v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUnknownNode() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnknownNode() => clearField(5);
  @$pb.TagNumber(5)
  GUnknownNode ensureUnknownNode() => $_ensure(4);
}

class GTagsContainer extends $pb.GeneratedMessage {
  factory GTagsContainer({
    $core.Iterable<GTagNode>? nodes,
  }) {
    final $result = create();
    if (nodes != null) {
      $result.nodes.addAll(nodes);
    }
    return $result;
  }
  GTagsContainer._() : super();
  factory GTagsContainer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GTagsContainer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GTagsContainer', package: const $pb.PackageName(_omitMessageNames ? '' : 'io.nanc.nanc'), createEmptyInstance: create)
    ..pc<GTagNode>(2, _omitFieldNames ? '' : 'nodes', $pb.PbFieldType.PM, subBuilder: GTagNode.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GTagsContainer clone() => GTagsContainer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GTagsContainer copyWith(void Function(GTagsContainer) updates) => super.copyWith((message) => updates(message as GTagsContainer)) as GTagsContainer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GTagsContainer create() => GTagsContainer._();
  GTagsContainer createEmptyInstance() => create();
  static $pb.PbList<GTagsContainer> createRepeated() => $pb.PbList<GTagsContainer>();
  @$core.pragma('dart2js:noInline')
  static GTagsContainer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GTagsContainer>(create);
  static GTagsContainer? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<GTagNode> get nodes => $_getList(0);
}

class GWidgetTag extends $pb.GeneratedMessage {
  factory GWidgetTag({
    GTagNodeType? type,
    $core.String? tag,
    $core.Iterable<GTagNode>? children,
    $core.Map<$core.String, $core.String>? attributes,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (tag != null) {
      $result.tag = tag;
    }
    if (children != null) {
      $result.children.addAll(children);
    }
    if (attributes != null) {
      $result.attributes.addAll(attributes);
    }
    return $result;
  }
  GWidgetTag._() : super();
  factory GWidgetTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GWidgetTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GWidgetTag', package: const $pb.PackageName(_omitMessageNames ? '' : 'io.nanc.nanc'), createEmptyInstance: create)
    ..e<GTagNodeType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: GTagNodeType.G_TAG_NODE_TYPE_WIDGET, valueOf: GTagNodeType.valueOf, enumValues: GTagNodeType.values)
    ..aOS(3, _omitFieldNames ? '' : 'tag')
    ..pc<GTagNode>(4, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: GTagNode.create)
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'attributes', entryClassName: 'GWidgetTag.AttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('io.nanc.nanc'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GWidgetTag clone() => GWidgetTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GWidgetTag copyWith(void Function(GWidgetTag) updates) => super.copyWith((message) => updates(message as GWidgetTag)) as GWidgetTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GWidgetTag create() => GWidgetTag._();
  GWidgetTag createEmptyInstance() => create();
  static $pb.PbList<GWidgetTag> createRepeated() => $pb.PbList<GWidgetTag>();
  @$core.pragma('dart2js:noInline')
  static GWidgetTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GWidgetTag>(create);
  static GWidgetTag? _defaultInstance;

  @$pb.TagNumber(2)
  GTagNodeType get type => $_getN(0);
  @$pb.TagNumber(2)
  set type(GTagNodeType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tag => $_getSZ(1);
  @$pb.TagNumber(3)
  set tag($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(3)
  void clearTag() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<GTagNode> get children => $_getList(2);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get attributes => $_getMap(3);
}

class GPropertyTag extends $pb.GeneratedMessage {
  factory GPropertyTag({
    GTagNodeType? type,
    $core.String? tag,
    $core.Iterable<GTagNode>? children,
    $core.Map<$core.String, $core.String>? attributes,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (tag != null) {
      $result.tag = tag;
    }
    if (children != null) {
      $result.children.addAll(children);
    }
    if (attributes != null) {
      $result.attributes.addAll(attributes);
    }
    return $result;
  }
  GPropertyTag._() : super();
  factory GPropertyTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GPropertyTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GPropertyTag', package: const $pb.PackageName(_omitMessageNames ? '' : 'io.nanc.nanc'), createEmptyInstance: create)
    ..e<GTagNodeType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: GTagNodeType.G_TAG_NODE_TYPE_WIDGET, valueOf: GTagNodeType.valueOf, enumValues: GTagNodeType.values)
    ..aOS(3, _omitFieldNames ? '' : 'tag')
    ..pc<GTagNode>(4, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: GTagNode.create)
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'attributes', entryClassName: 'GPropertyTag.AttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('io.nanc.nanc'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GPropertyTag clone() => GPropertyTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GPropertyTag copyWith(void Function(GPropertyTag) updates) => super.copyWith((message) => updates(message as GPropertyTag)) as GPropertyTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GPropertyTag create() => GPropertyTag._();
  GPropertyTag createEmptyInstance() => create();
  static $pb.PbList<GPropertyTag> createRepeated() => $pb.PbList<GPropertyTag>();
  @$core.pragma('dart2js:noInline')
  static GPropertyTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GPropertyTag>(create);
  static GPropertyTag? _defaultInstance;

  @$pb.TagNumber(2)
  GTagNodeType get type => $_getN(0);
  @$pb.TagNumber(2)
  set type(GTagNodeType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tag => $_getSZ(1);
  @$pb.TagNumber(3)
  set tag($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(3)
  void clearTag() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<GTagNode> get children => $_getList(2);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get attributes => $_getMap(3);
}

class GTextNode extends $pb.GeneratedMessage {
  factory GTextNode({
    GTagNodeType? type,
    $core.String? text,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (text != null) {
      $result.text = text;
    }
    return $result;
  }
  GTextNode._() : super();
  factory GTextNode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GTextNode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GTextNode', package: const $pb.PackageName(_omitMessageNames ? '' : 'io.nanc.nanc'), createEmptyInstance: create)
    ..e<GTagNodeType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: GTagNodeType.G_TAG_NODE_TYPE_WIDGET, valueOf: GTagNodeType.valueOf, enumValues: GTagNodeType.values)
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GTextNode clone() => GTextNode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GTextNode copyWith(void Function(GTextNode) updates) => super.copyWith((message) => updates(message as GTextNode)) as GTextNode;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GTextNode create() => GTextNode._();
  GTextNode createEmptyInstance() => create();
  static $pb.PbList<GTextNode> createRepeated() => $pb.PbList<GTextNode>();
  @$core.pragma('dart2js:noInline')
  static GTextNode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GTextNode>(create);
  static GTextNode? _defaultInstance;

  @$pb.TagNumber(2)
  GTagNodeType get type => $_getN(0);
  @$pb.TagNumber(2)
  set type(GTagNodeType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);
}

class GUnknownNode extends $pb.GeneratedMessage {
  factory GUnknownNode({
    GTagNodeType? type,
    $core.String? text,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (text != null) {
      $result.text = text;
    }
    return $result;
  }
  GUnknownNode._() : super();
  factory GUnknownNode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GUnknownNode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GUnknownNode', package: const $pb.PackageName(_omitMessageNames ? '' : 'io.nanc.nanc'), createEmptyInstance: create)
    ..e<GTagNodeType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: GTagNodeType.G_TAG_NODE_TYPE_WIDGET, valueOf: GTagNodeType.valueOf, enumValues: GTagNodeType.values)
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GUnknownNode clone() => GUnknownNode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GUnknownNode copyWith(void Function(GUnknownNode) updates) => super.copyWith((message) => updates(message as GUnknownNode)) as GUnknownNode;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GUnknownNode create() => GUnknownNode._();
  GUnknownNode createEmptyInstance() => create();
  static $pb.PbList<GUnknownNode> createRepeated() => $pb.PbList<GUnknownNode>();
  @$core.pragma('dart2js:noInline')
  static GUnknownNode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GUnknownNode>(create);
  static GUnknownNode? _defaultInstance;

  @$pb.TagNumber(2)
  GTagNodeType get type => $_getN(0);
  @$pb.TagNumber(2)
  set type(GTagNodeType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
