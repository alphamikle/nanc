import 'package:tag_converter/tag_converter.dart';

List<TagNode>? enrichNodesWithAttribute({
  required String attributeName,
  required String attributeValue,
  required List<TagNode>? nodes,
}) {
  if (nodes == null) {
    return null;
  }
  final List<TagNode> output = [];
  for (final TagNode node in nodes) {
    if (node is WidgetTag) {
      final List<TagNode>? newChildren = enrichNodesWithAttribute(
        attributeName: attributeName,
        attributeValue: attributeValue,
        nodes: node.children,
      );
      final Map<String, String> attributes = {...node.attributes};
      attributes[attributeName] = attributeValue;
      output.add(node.copyWith(children: newChildren ?? [], attributes: attributes));
    } else {
      output.add(node);
    }
  }
  return output;
}
