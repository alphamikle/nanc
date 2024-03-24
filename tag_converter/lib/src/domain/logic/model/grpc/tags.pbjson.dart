//
//  Generated code. Do not modify.
//  source: tags.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use gTagNodeTypeDescriptor instead')
const GTagNodeType$json = {
  '1': 'GTagNodeType',
  '2': [
    {'1': 'G_TAG_NODE_TYPE_WIDGET', '2': 0},
    {'1': 'G_TAG_NODE_TYPE_PROPERTY', '2': 1},
    {'1': 'G_TAG_NODE_TYPE_TEXT', '2': 2},
    {'1': 'G_TAG_NODE_TYPE_UNKNOWN', '2': 3},
  ],
};

/// Descriptor for `GTagNodeType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List gTagNodeTypeDescriptor = $convert.base64Decode(
    'CgxHVGFnTm9kZVR5cGUSGgoWR19UQUdfTk9ERV9UWVBFX1dJREdFVBAAEhwKGEdfVEFHX05PRE'
    'VfVFlQRV9QUk9QRVJUWRABEhgKFEdfVEFHX05PREVfVFlQRV9URVhUEAISGwoXR19UQUdfTk9E'
    'RV9UWVBFX1VOS05PV04QAw==');

@$core.Deprecated('Use gFieldsOfTagNodeDescriptor instead')
const GFieldsOfTagNode$json = {
  '1': 'GFieldsOfTagNode',
  '2': [
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.io.nanc.nanc.GTagNodeType', '10': 'type'},
  ],
};

/// Descriptor for `GFieldsOfTagNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gFieldsOfTagNodeDescriptor = $convert.base64Decode(
    'ChBHRmllbGRzT2ZUYWdOb2RlEi4KBHR5cGUYAiABKA4yGi5pby5uYW5jLm5hbmMuR1RhZ05vZG'
    'VUeXBlUgR0eXBl');

@$core.Deprecated('Use gTagNodeDescriptor instead')
const GTagNode$json = {
  '1': 'GTagNode',
  '2': [
    {'1': 'tag_node', '3': 1, '4': 1, '5': 11, '6': '.io.nanc.nanc.GFieldsOfTagNode', '9': 0, '10': 'tagNode'},
    {'1': 'widget_tag', '3': 2, '4': 1, '5': 11, '6': '.io.nanc.nanc.GWidgetTag', '9': 0, '10': 'widgetTag'},
    {'1': 'property_tag', '3': 3, '4': 1, '5': 11, '6': '.io.nanc.nanc.GPropertyTag', '9': 0, '10': 'propertyTag'},
    {'1': 'text_node', '3': 4, '4': 1, '5': 11, '6': '.io.nanc.nanc.GTextNode', '9': 0, '10': 'textNode'},
    {'1': 'unknown_node', '3': 5, '4': 1, '5': 11, '6': '.io.nanc.nanc.GUnknownNode', '9': 0, '10': 'unknownNode'},
  ],
  '8': [
    {'1': 'props'},
  ],
};

/// Descriptor for `GTagNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gTagNodeDescriptor = $convert.base64Decode(
    'CghHVGFnTm9kZRI7Cgh0YWdfbm9kZRgBIAEoCzIeLmlvLm5hbmMubmFuYy5HRmllbGRzT2ZUYW'
    'dOb2RlSABSB3RhZ05vZGUSOQoKd2lkZ2V0X3RhZxgCIAEoCzIYLmlvLm5hbmMubmFuYy5HV2lk'
    'Z2V0VGFnSABSCXdpZGdldFRhZxI/Cgxwcm9wZXJ0eV90YWcYAyABKAsyGi5pby5uYW5jLm5hbm'
    'MuR1Byb3BlcnR5VGFnSABSC3Byb3BlcnR5VGFnEjYKCXRleHRfbm9kZRgEIAEoCzIXLmlvLm5h'
    'bmMubmFuYy5HVGV4dE5vZGVIAFIIdGV4dE5vZGUSPwoMdW5rbm93bl9ub2RlGAUgASgLMhouaW'
    '8ubmFuYy5uYW5jLkdVbmtub3duTm9kZUgAUgt1bmtub3duTm9kZUIHCgVwcm9wcw==');

@$core.Deprecated('Use gTagsContainerDescriptor instead')
const GTagsContainer$json = {
  '1': 'GTagsContainer',
  '2': [
    {'1': 'nodes', '3': 2, '4': 3, '5': 11, '6': '.io.nanc.nanc.GTagNode', '10': 'nodes'},
  ],
};

/// Descriptor for `GTagsContainer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gTagsContainerDescriptor = $convert.base64Decode(
    'Cg5HVGFnc0NvbnRhaW5lchIsCgVub2RlcxgCIAMoCzIWLmlvLm5hbmMubmFuYy5HVGFnTm9kZV'
    'IFbm9kZXM=');

@$core.Deprecated('Use gWidgetTagDescriptor instead')
const GWidgetTag$json = {
  '1': 'GWidgetTag',
  '2': [
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.io.nanc.nanc.GTagNodeType', '10': 'type'},
    {'1': 'tag', '3': 3, '4': 1, '5': 9, '10': 'tag'},
    {'1': 'children', '3': 4, '4': 3, '5': 11, '6': '.io.nanc.nanc.GTagNode', '10': 'children'},
    {'1': 'attributes', '3': 5, '4': 3, '5': 11, '6': '.io.nanc.nanc.GWidgetTag.AttributesEntry', '10': 'attributes'},
  ],
  '3': [GWidgetTag_AttributesEntry$json],
};

@$core.Deprecated('Use gWidgetTagDescriptor instead')
const GWidgetTag_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GWidgetTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gWidgetTagDescriptor = $convert.base64Decode(
    'CgpHV2lkZ2V0VGFnEi4KBHR5cGUYAiABKA4yGi5pby5uYW5jLm5hbmMuR1RhZ05vZGVUeXBlUg'
    'R0eXBlEhAKA3RhZxgDIAEoCVIDdGFnEjIKCGNoaWxkcmVuGAQgAygLMhYuaW8ubmFuYy5uYW5j'
    'LkdUYWdOb2RlUghjaGlsZHJlbhJICgphdHRyaWJ1dGVzGAUgAygLMiguaW8ubmFuYy5uYW5jLk'
    'dXaWRnZXRUYWcuQXR0cmlidXRlc0VudHJ5UgphdHRyaWJ1dGVzGj0KD0F0dHJpYnV0ZXNFbnRy'
    'eRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use gPropertyTagDescriptor instead')
const GPropertyTag$json = {
  '1': 'GPropertyTag',
  '2': [
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.io.nanc.nanc.GTagNodeType', '10': 'type'},
    {'1': 'tag', '3': 3, '4': 1, '5': 9, '10': 'tag'},
    {'1': 'children', '3': 4, '4': 3, '5': 11, '6': '.io.nanc.nanc.GTagNode', '10': 'children'},
    {'1': 'attributes', '3': 5, '4': 3, '5': 11, '6': '.io.nanc.nanc.GPropertyTag.AttributesEntry', '10': 'attributes'},
  ],
  '3': [GPropertyTag_AttributesEntry$json],
};

@$core.Deprecated('Use gPropertyTagDescriptor instead')
const GPropertyTag_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GPropertyTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gPropertyTagDescriptor = $convert.base64Decode(
    'CgxHUHJvcGVydHlUYWcSLgoEdHlwZRgCIAEoDjIaLmlvLm5hbmMubmFuYy5HVGFnTm9kZVR5cG'
    'VSBHR5cGUSEAoDdGFnGAMgASgJUgN0YWcSMgoIY2hpbGRyZW4YBCADKAsyFi5pby5uYW5jLm5h'
    'bmMuR1RhZ05vZGVSCGNoaWxkcmVuEkoKCmF0dHJpYnV0ZXMYBSADKAsyKi5pby5uYW5jLm5hbm'
    'MuR1Byb3BlcnR5VGFnLkF0dHJpYnV0ZXNFbnRyeVIKYXR0cmlidXRlcxo9Cg9BdHRyaWJ1dGVz'
    'RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use gTextNodeDescriptor instead')
const GTextNode$json = {
  '1': 'GTextNode',
  '2': [
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.io.nanc.nanc.GTagNodeType', '10': 'type'},
    {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `GTextNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gTextNodeDescriptor = $convert.base64Decode(
    'CglHVGV4dE5vZGUSLgoEdHlwZRgCIAEoDjIaLmlvLm5hbmMubmFuYy5HVGFnTm9kZVR5cGVSBH'
    'R5cGUSEgoEdGV4dBgDIAEoCVIEdGV4dA==');

@$core.Deprecated('Use gUnknownNodeDescriptor instead')
const GUnknownNode$json = {
  '1': 'GUnknownNode',
  '2': [
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.io.nanc.nanc.GTagNodeType', '10': 'type'},
    {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `GUnknownNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gUnknownNodeDescriptor = $convert.base64Decode(
    'CgxHVW5rbm93bk5vZGUSLgoEdHlwZRgCIAEoDjIaLmlvLm5hbmMubmFuYy5HVGFnTm9kZVR5cG'
    'VSBHR5cGUSEgoEdGV4dBgDIAEoCVIEdGV4dA==');

