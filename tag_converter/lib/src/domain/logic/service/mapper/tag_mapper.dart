import 'dart:developer';

import 'package:xml/xml.dart';

import '../../../../service/serialization.dart';
import '../../model/tag.dart';
import '../converter/tags_converter.dart';

extension XmlNodeConverter on XmlNode {
  TagNode toTag() {
    if (this is XmlElement) {
      final XmlElement self = this as XmlElement;
      final Map<String, String> attributes = {};
      for (final XmlAttribute attribute in self.attributes) {
        attributes[attribute.localName] = attribute.value;
      }
      final String tag = self.qualifiedName;

      if (tag.startsWith(kPropertyPrefix)) {
        return PropertyTag(
          tag: self.qualifiedName,
          children: self.children.toTags(),
          attributes: attributes,
        );
      }
      return WidgetTag(
        tag: self.qualifiedName,
        children: self.children.toTags(),
        attributes: attributes,
      );
    } else if (this is XmlText) {
      final XmlText self = this as XmlText;
      final String trimmedText = self.value.trim();

      if (trimmedText.isEmpty || trimmedText == '\n') {
        return UnknownNode(text: self.value);
      }

      return TextNode(text: self.value);
    }
    return UnknownNode(text: value ?? '');
  }
}

extension XmlNodesConverter on Iterable<XmlNode> {
  List<TagNode> toTags() {
    final List<TagNode> nodes = [];
    for (final XmlNode xmlNode in this) {
      final TagNode tagNode = xmlNode.toTag();
      if (tagNode is! UnknownNode) {
        nodes.add(tagNode);
      }
    }
    return nodes;
  }

  Future<List<TagNode>> toTagsAsync() async {
    throw UnimplementedError('Async converting not ready for now');
    // final List<TagNode> nodes = [];
    // for (final XmlNode xmlNode in this) {
    //   if (Delayer.needToPause(pauseEveryCycles: 17)) {
    //     await Delayer.pause();
    //   }
    //   final TagNode tagNode = xmlNode.toTag();
    //   if (tagNode is! UnknownNode) {
    //     nodes.add(tagNode);
    //   }
    // }
    // return nodes;
  }
}

extension TagsNodesConverter on List<TagNode> {
  List<Json> toJson() {
    return listOfTagNodesToJson(this);
  }
}

TagNode tagNodeFromJson(dynamic rawJson) {
  if (rawJson is DJson) {
    return switch (rawJson['type']) {
      'property' => PropertyTag.fromJson(rawJson),
      'text' => TextNode.fromJson(rawJson),
      'widget' => WidgetTag.fromJson(rawJson),
      'unknown' => UnknownNode.fromJson(rawJson),
      _ => throw Exception('Incorrect type of json: ${rawJson.runtimeType}'),
    } as TagNode;
  }
  throw Exception('Incorrect type of json: ${rawJson.runtimeType}');
}

Json tagNodeToJson(TagNode tagNode) {
  return switch (tagNode) {
    PropertyTag() => tagNode.toJson(),
    TextNode() => tagNode.toJson(),
    WidgetTag() => tagNode.toJson(),
    UnknownNode() => tagNode.toJson(),
  };
}

List<TagNode> listOfTagNodesFromJson(dynamic rawJson) {
  if (rawJson is List) {
    return rawJson.map(tagNodeFromJson).toList();
  }
  log('Incorrect type of json: ${rawJson.runtimeType}');
  return [];
}

List<Json> listOfTagNodesToJson(List<TagNode> tagNodes) => tagNodes.map(tagNodeToJson).toList();
