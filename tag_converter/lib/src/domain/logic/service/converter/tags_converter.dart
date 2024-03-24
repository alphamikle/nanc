import 'dart:developer';
import 'dart:typed_data';

import 'package:xml/xml.dart';

import '../../model/grpc/tags.pb.dart';
import '../../model/tag.dart';
import '../mapper/tag_mapper.dart';
import '../xml_parser/xml_parser_expo.dart';

const String kPropertyPrefix = 'prop:';

abstract final class TagsConverter {
  static List<TagNode> fromXml(String xml) {
    try {
      final XmlNode node = parseXmlSync(xml);
      final XmlElement rootElement = node.children.firstWhere((XmlNode it) => it is XmlElement && it.localName == kRootNode) as XmlElement;
      return rootElement.children.toTags();
    } catch (error, stackTrace) {
      log('Error on generating widgets from the XML', error: error, stackTrace: stackTrace);
      return [];
    }
  }

  static Future<List<TagNode>> fromXmlAsync(String xml) {
    throw UnimplementedError('Async converting not ready for now');
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
    final GTagsContainer protoForm = TagsContainer(nodes: nodes).toProto();
    return protoForm.writeToBuffer();
  }
}
