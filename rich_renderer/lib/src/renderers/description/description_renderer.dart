import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/description/description_tag_renderer.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';

final RegExp clearingRegExp = RegExp(r'\n');

String _clear(String text) => text.replaceAll(clearingRegExp, ' ');

md.Node _prepareText(md.Node node) {
  if (node is md.Text) {
    return md.Text(_clear(node.text));
  } else if (node is md.UnparsedContent) {
    return md.UnparsedContent(_clear(node.textContent));
  } else if (node is md.Element) {
    final md.Element element = md.Element(
      node.tag,
      node.children == null ? null : node.children!.map((e) => _prepareText(e)).toList(),
    );
    element.attributes.addAll(node.attributes);
    return element;
  }
  return node;
}

TagRenderer descriptionRenderer() {
  return DescriptionTagRenderer(
    icon: IconPack.mdi_help_box,
    tag: 'description',
    pattern: RegExp(r'<description.*>'),
    endPattern: RegExp('</description>'),
    example: '',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final List<md.Node> preparedNodes = (element.children ?? []).map((md.Node node) => _prepareText(node)).toList();
      final List<Widget> children = await richRenderer.renderChildren(context, preparedNodes);

      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            bottom: 16,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children
                    .map((Widget child) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: child,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      );
    },
  );
}
