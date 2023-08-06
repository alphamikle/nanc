import 'package:xml/xml.dart';

import '../../../../nanc_renderer.dart';
import '../../../service/delayer.dart';

extension XmlNodeConverter on XmlNode {
  TagNode toTagNode() {
    if (this is XmlElement) {
      final XmlElement self = this as XmlElement;
      final Map<String, String> attributes = {};
      for (final XmlAttribute attribute in self.attributes) {
        attributes[attribute.localName] = attribute.value;
      }
      final String tag = self.qualifiedName;

      if (tag.startsWith(propertyPrefix)) {
        return PropertyTag(
          tag: self.qualifiedName,
          children: self.children.toTagNodes(),
          attributes: attributes,
        );
      }
      return WidgetTag(
        tag: self.qualifiedName,
        children: self.children.toTagNodes(),
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
  List<TagNode> toTagNodes() {
    final List<TagNode> nodes = [];
    for (final XmlNode xmlNode in this) {
      final TagNode tagNode = xmlNode.toTagNode();
      if (tagNode is! UnknownNode) {
        nodes.add(tagNode);
      }
    }
    return nodes;
  }

  Future<List<TagNode>> toTagNodesAsync() async {
    final List<TagNode> nodes = [];
    for (final XmlNode xmlNode in this) {
      if (Delayer.needToPause(pauseEveryCycles: 17)) {
        await Delayer.pause();
      }
      final TagNode tagNode = xmlNode.toTagNode();
      if (tagNode is! UnknownNode) {
        nodes.add(tagNode);
      }
    }
    return nodes;
  }
}
