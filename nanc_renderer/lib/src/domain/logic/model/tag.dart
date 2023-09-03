import 'dart:typed_data';

import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:proto_annotations/proto_annotations.dart';
import 'package:tools/tools.dart';

import 'grpc/tags.grpc.dart';

part 'tag.g.dart';

@proto
enum TagNodeType {
  @ProtoField(2)
  widget,
  @ProtoField(3)
  property,
  @ProtoField(4)
  text,
  @ProtoField(5)
  unknown;

  bool get isWidget => this == TagNodeType.widget;

  bool get isProperty => this == TagNodeType.property;

  bool get isText => this == TagNodeType.text;

  bool get isUnknown => this == TagNodeType.unknown;
}

TagNode tagNodeFromJson(dynamic rawJson) {
  if (rawJson is DJson) {
    return switch (rawJson['type']) {
      'widget' => WidgetTag.fromJson(rawJson),
      'property' => PropertyTag.fromJson(rawJson),
      'text' => TextNode.fromJson(rawJson),
      'unknown' => UnknownNode.fromJson(rawJson),
      _ => throw Exception('Incorrect type of json: ${rawJson.runtimeType}'),
    } as TagNode;
  }
  throw Exception('Incorrect type of json: ${rawJson.runtimeType}');
}

Json tagNodeToJson(TagNode tagNode) {
  return switch (tagNode) {
    PropertyTag() => tagNode.toJson(),
    WidgetTag() => tagNode.toJson(),
    TextNode() => tagNode.toJson(),
    UnknownNode() => tagNode.toJson(),
  };
}

List<TagNode> listOfTagNodesFromJson(dynamic rawJson) {
  if (rawJson is List) {
    return rawJson.map(tagNodeFromJson).toList();
  }
  logWarning('Incorrect type of json: ${rawJson.runtimeType}');
  return [];
}

List<Json> listOfTagNodesToJson(List<TagNode> tagNodes) => tagNodes.map(tagNodeToJson).toList();

@Proto(knownSubClassMap: {
  WidgetTag: 2,
  PropertyTag: 3,
  TextNode: 4,
  UnknownNode: 5,
})
sealed class TagNode {
  const TagNode({
    required this.type,
  });

  @ProtoField(2)
  final TagNodeType type;

  Json toJson();
}

@proto
@autoequal
@CopyWith()
@JsonSerializable()
class TagsContainer extends Equatable {
  const TagsContainer({
    required this.nodes,
  });

  factory TagsContainer.fromProto(Uint8List buffer) => _$TagsContainerFromProto(GTagsContainer.fromBuffer(buffer));

  factory TagsContainer.fromJson(dynamic json) => _$TagsContainerFromJson(castToJson(json));

  @ProtoField(2)
  @JsonKey(fromJson: listOfTagNodesFromJson, toJson: listOfTagNodesToJson)
  final List<TagNode> nodes;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$TagsContainerToJson(this);
}

@proto
@autoequal
@CopyWith()
@JsonSerializable()
class WidgetTag extends Equatable implements TagNode {
  const WidgetTag({
    required this.tag,
    required this.children,
    required this.attributes,
    TagNodeType type = TagNodeType.widget,
  }) : type = TagNodeType.widget;

  factory WidgetTag.fromJson(dynamic json) => _$WidgetTagFromJson(castToJson(json));

  @override
  @ProtoField(2)
  final TagNodeType type;

  @ProtoField(3)
  final String tag;

  @ProtoField(4)
  @JsonKey(fromJson: listOfTagNodesFromJson, toJson: listOfTagNodesToJson)
  final List<TagNode> children;

  @ProtoField(5)
  final Map<String, String> attributes;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$WidgetTagToJson(this);
}

@proto
@autoequal
@CopyWith()
@JsonSerializable()
class PropertyTag extends Equatable implements WidgetTag {
  const PropertyTag({
    required this.tag,
    required this.children,
    required this.attributes,
    TagNodeType type = TagNodeType.property,
  }) : type = TagNodeType.property;

  factory PropertyTag.fromJson(dynamic json) => _$PropertyTagFromJson(castToJson(json));

  @override
  @ProtoField(2)
  final TagNodeType type;

  @override
  @ProtoField(3)
  final String tag;

  @override
  @ProtoField(4)
  @JsonKey(fromJson: listOfTagNodesFromJson, toJson: listOfTagNodesToJson)
  final List<TagNode> children;

  @override
  @ProtoField(5)
  final Map<String, String> attributes;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$PropertyTagToJson(this);
}

@proto
@autoequal
@CopyWith()
@JsonSerializable()
class TextNode extends Equatable implements TagNode {
  const TextNode({
    required this.text,
    TagNodeType type = TagNodeType.text,
  }) : type = TagNodeType.text;

  factory TextNode.fromJson(dynamic json) => _$TextNodeFromJson(castToJson(json));

  @override
  @ProtoField(2)
  final TagNodeType type;

  @ProtoField(3)
  final String text;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$TextNodeToJson(this);
}

@proto
@autoequal
@CopyWith()
@JsonSerializable()
class UnknownNode extends Equatable implements TagNode {
  const UnknownNode({
    required this.text,
    TagNodeType type = TagNodeType.text,
  }) : type = TagNodeType.text;

  factory UnknownNode.fromJson(dynamic json) => _$UnknownNodeFromJson(castToJson(json));

  @override
  @ProtoField(2)
  final TagNodeType type;

  @ProtoField(3)
  final String text;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$UnknownNodeToJson(this);
}
