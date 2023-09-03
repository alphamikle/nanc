//
//  Generated code. Do not modify.
//  source: tags.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GTagNodeType extends $pb.ProtobufEnum {
  static const GTagNodeType G_TAG_NODE_TYPE_WIDGET = GTagNodeType._(0, _omitEnumNames ? '' : 'G_TAG_NODE_TYPE_WIDGET');
  static const GTagNodeType G_TAG_NODE_TYPE_PROPERTY = GTagNodeType._(1, _omitEnumNames ? '' : 'G_TAG_NODE_TYPE_PROPERTY');
  static const GTagNodeType G_TAG_NODE_TYPE_TEXT = GTagNodeType._(2, _omitEnumNames ? '' : 'G_TAG_NODE_TYPE_TEXT');
  static const GTagNodeType G_TAG_NODE_TYPE_UNKNOWN = GTagNodeType._(3, _omitEnumNames ? '' : 'G_TAG_NODE_TYPE_UNKNOWN');

  static const $core.List<GTagNodeType> values = <GTagNodeType> [
    G_TAG_NODE_TYPE_WIDGET,
    G_TAG_NODE_TYPE_PROPERTY,
    G_TAG_NODE_TYPE_TEXT,
    G_TAG_NODE_TYPE_UNKNOWN,
  ];

  static final $core.Map<$core.int, GTagNodeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GTagNodeType? valueOf($core.int value) => _byValue[value];

  const GTagNodeType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
