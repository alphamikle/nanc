import 'package:tools/tools.dart';
import 'package:xml/xml.dart';

import '../../../../nanc_renderer.dart';

extension XmlNodeConverter on XmlNode {
  TagNode toTag() {
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
    final List<TagNode> nodes = [];
    for (final XmlNode xmlNode in this) {
      if (Delayer.needToPause(pauseEveryCycles: 17)) {
        await Delayer.pause();
      }
      final TagNode tagNode = xmlNode.toTag();
      if (tagNode is! UnknownNode) {
        nodes.add(tagNode);
      }
    }
    return nodes;
  }
}
