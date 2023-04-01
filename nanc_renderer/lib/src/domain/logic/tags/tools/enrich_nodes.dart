import 'package:markdown/markdown.dart' as md;

List<md.Node>? enrichNodesWithAttribute({
  required String attributeName,
  required String attributeValue,
  required List<md.Node>? nodes,
}) {
  if (nodes == null) {
    return null;
  }
  final List<md.Node> output = [];
  for (final md.Node node in nodes) {
    if (node is md.Element) {
      final List<md.Node>? newChildren = node.children == null
          ? null
          : enrichNodesWithAttribute(
              attributeName: attributeName,
              attributeValue: attributeValue,
              nodes: node.children!,
            );
      final md.Element newNode = md.Element(node.tag, newChildren);
      newNode.attributes.addAll(node.attributes);
      newNode.attributes[attributeName] = attributeValue;
      output.add(newNode);
    } else {
      output.add(node);
    }
  }
  return output;
}
