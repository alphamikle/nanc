import 'package:markdown/markdown.dart' as md;
import 'package:xml/xml.dart';

extension XmlNodeConverter on XmlNode {
  md.Node toMarkdownNode() {
    if (this is XmlElement) {
      final XmlElement self = this as XmlElement;
      // if (self.localName == 'decoration') {
      //   print(1);
      // }
      final md.Element element = md.Element(
        self.qualifiedName,
        self.children.toMarkdownNodes(),
      );
      for (final XmlAttribute attribute in self.attributes) {
        element.attributes[attribute.localName] = attribute.value;
      }
      return element;
    } else if (this is XmlText) {
      final XmlText self = this as XmlText;
      final String trimmedText = self.text.trim();

      if (trimmedText.isEmpty || trimmedText == '\n') {
        return md.UnparsedContent(self.text);
      }
      return md.Text(self.text);
    }
    return md.UnparsedContent(text);
  }
}

extension XmlNodesConverter on Iterable<XmlNode> {
  List<md.Node> toMarkdownNodes() {
    return map((e) => e.toMarkdownNode()).where((md.Node node) => node is! md.UnparsedContent).toList();
  }
}
