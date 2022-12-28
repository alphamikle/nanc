import 'package:markdown/markdown.dart';
import 'package:markdown_code_push/src/syntax/block_with_children_syntax.dart';
import 'package:markdown_code_push/src/syntax/block_without_children_syntax.dart';
import 'package:rich_renderer/rich_renderer.dart';

BlockSyntax tagRendererToBlockSyntax(TagRenderer renderer) {
  if (renderer.isMultiline) {
    return BlockWithChildrenSyntax(
      tag: renderer.tag,
      pattern: renderer.pattern,
      endPattern: renderer.endPattern!,
    );
  }
  return BlockWithoutChildrenSyntax(
    tag: renderer.tag,
    pattern: renderer.pattern,
  );
}
