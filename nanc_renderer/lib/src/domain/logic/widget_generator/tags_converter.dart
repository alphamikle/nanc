import 'dart:typed_data';

import 'package:tools/tools.dart';
import 'package:xml/xml.dart';

import '../model/tag.dart';
import '../xml_parser/xml_parser_expo.dart';
import 'xml_node_extensions.dart';

abstract final class TagsConverter {
  static List<TagNode> fromXml(String xml) {
    try {
      final XmlNode node = parseXmlSync(xml);
      final XmlElement rootElement = node.children.firstWhere((XmlNode it) => it is XmlElement && it.localName == kRootNode) as XmlElement;
      return rootElement.children.toTags();
    } catch (error, stackTrace) {
      logError('Error on generating widgets from the XML', error: error, stackTrace: stackTrace);
      return [];
    }
  }

  // TODO(alphamikle): Optimize xml parsing and make it able to do asynchronously
  static Future<List<TagNode>> fromXmlAsync(String xml) {
    throw UnimplementedError();
  }

  static List<TagNode> fromBinary(Uint8List binary) {
    final TagsContainer tagsContainer = TagsContainer.fromProto(binary);
    return tagsContainer.nodes;
  }

  static List<TagNode> fromJson(dynamic json) => listOfTagNodesFromJson(json);

  static Uint8List? toBinaryFromXml(String xml) {
    final List<TagNode> nodes = TagsConverter.fromXml(xml);
    if (nodes.isEmpty) {
      return null;
    }
    return TagsContainer(nodes: nodes).toProto().writeToBuffer();
  }
}
