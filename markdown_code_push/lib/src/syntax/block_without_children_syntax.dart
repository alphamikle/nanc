import 'package:markdown/markdown.dart';
import 'package:markdown_code_push/src/tools/attrubutes_extractor.dart';

class BlockWithoutChildrenSyntax extends BlockSyntax {
  BlockWithoutChildrenSyntax({
    required this.pattern,
    required this.tag,
  });

  @override
  final RegExp pattern;
  final String tag;

  @override
  Node parse(BlockParser parser) {
    final Element element = Element(tag, null);
    final String current = parser.current;
    element.attributes.addAll(extractAttributes(current));
    parser.advance();
    return element;
  }
}
