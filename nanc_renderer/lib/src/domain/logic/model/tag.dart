import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'tag.g.dart';

enum TagNodeType {
  widget,
  property,
  text,
  unknown;

  bool get isWidget => this == TagNodeType.widget;
  bool get isProperty => this == TagNodeType.property;
  bool get isText => this == TagNodeType.text;
  bool get isUnknown => this == TagNodeType.unknown;
}

sealed class TagNode {
  TagNodeType get type;
  Json toJson();
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
  final TagNodeType type;

  final String tag;

  @JsonKey(fromJson: listOfTagNodesFromJson, toJson: listOfTagNodesToJson)
  final List<TagNode> children;

  final Map<String, String> attributes;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$WidgetTagToJson(this);
}

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
  final TagNodeType type;

  @override
  final String tag;

  @override
  @JsonKey(fromJson: listOfTagNodesFromJson, toJson: listOfTagNodesToJson)
  final List<TagNode> children;

  @override
  final Map<String, String> attributes;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$PropertyTagToJson(this);
}

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
  final TagNodeType type;

  final String text;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$TextNodeToJson(this);
}

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
  final TagNodeType type;

  final String text;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$UnknownNodeToJson(this);
}
