import 'package:markdown/markdown.dart';
import 'package:markdown_code_push/src/tools/attrubutes_extractor.dart';
import 'package:markdown_code_push_core/markdown_code_push_core.dart';

class BlockWithChildrenSyntax extends BlockSyntax {
  BlockWithChildrenSyntax({
    required this.pattern,
    required this.endPattern,
    required this.tag,
  });

  @override
  final RegExp pattern;
  final RegExp endPattern;
  final String tag;

  @override
  Node parse(BlockParser parser) {
    int startCount = 0;
    bool isEndFound = false;
    final List<String> childLines = [];
    // Eat until we hit [endPattern].
    while (!parser.isDone) {
      final String current = parser.current;
      childLines.add(current);
      if (parser.matches(pattern)) {
        startCount++;
      }
      if (parser.matches(endPattern)) {
        startCount--;
        if (startCount < 0) {
          throw Exception('You should use $pattern tag before $endPattern');
        }
        if (startCount == 0) {
          isEndFound = true;
          break;
        }
      }
      parser.advance();
    }
    parser.advance();
    if (!isEndFound) {
      // TODO(alphamikle): Add error tag; See: https://trello.com/c/0exbNgPI
      return Element(p, null);
    }

    /// ? Removing the tag itself start and the end
    final String first = childLines.removeAt(0);
    childLines.removeLast();
    final childrenElements = BlockParser(childLines, parser.document).parseLines();

    final Element element = Element(tag, childrenElements);
    element.attributes.addAll(extractAttributes(first));
    return element;
  }
}
