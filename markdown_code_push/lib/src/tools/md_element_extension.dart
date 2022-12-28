import 'dart:convert';

import 'package:markdown/markdown.dart' as md;

extension MdElementExtension on md.Element {
  String prettyString() {
    const JsonEncoder encoder = JsonEncoder.withIndent(' ');
    return encoder.convert(toJson());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': 'element',
      'content': {
        'tag': tag,
        'attributes': attributes,
        'generated_id': generatedId,
        'children': children == null ? null : children!.map<dynamic>(_nodeToJson).toList(),
      },
    };
  }
}

dynamic _nodeToJson(md.Node node) {
  if (node is md.Element) {
    return node.toJson();
  } else if (node is md.Text) {
    return <String, dynamic>{
      'type': 'text',
      'content': node.textContent,
    };
  } else if (node is md.UnparsedContent) {
    return <String, dynamic>{
      'type': 'unparsed_content',
      'content': node.textContent,
    };
  } else {
    return null;
  }
}

extension NodeToString on md.Node {
  String toPrettyString() {
    if (this is md.Text) {
      return textContent;
    } else if (this is md.UnparsedContent) {
      return textContent;
    }
    return 'unknown_node';
  }
}
