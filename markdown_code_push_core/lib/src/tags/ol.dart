import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;
import 'package:markdown_code_push_core/src/config/style_config.dart';
import 'package:markdown_code_push_core/src/tags/markdown_tags.dart';
import 'package:markdown_code_push_core/src/tags/p.dart';
import 'package:markdown_code_push_core/src/tags/ul.dart';

///the orderly list widget
class OLWidget extends StatelessWidget {

  const OLWidget({
    super.key,
    required this.rootNode,
    required this.deep,
  });
  final m.Element rootNode;
  final int deep;

  @override
  Widget build(BuildContext context) {
    final children = rootNode.children;
    if (children == null) return Container();
    return Column(
      children: List.generate(
        children.length,
        (index) {
          final node = children[index];
          if (node is m.Element) {
            if (node.tag == li) return _LiWidget(rootNode: node, deep: deep, index: index);
            if (node.tag == ol) return OLWidget(rootNode: node, deep: deep + 1);
          }
          return Container();
        },
      ),
    );
  }
}

///the orderly or unOrderly list inside [ULWidget]
class _LiWidget extends StatelessWidget {

  const _LiWidget({
    required this.rootNode,
    required this.deep,
    required this.index,
  });
  final m.Element rootNode;
  final int deep;
  final int index;

  @override
  Widget build(BuildContext context) {
    final children = rootNode.children ?? [];
    final List<m.Node> otherTagNodes = [];
    List<Widget> listChildren = [];
    for (final node in children) {
      if (node is m.Element && node.tag == ol) {
        final child = OLWidget(rootNode: node, deep: deep + 1);
        listChildren.add(child);
      } else if (node is m.Element && node.tag == ul) {
        final child = ULWidget(rootNode: node, deep: deep + 1);
        listChildren.add(child);
      } else {
        otherTagNodes.add(node);
      }
    }
    final config = StyleConfig().olConfig;
    final olChild = Container(
      margin: EdgeInsets.only(
        left: config?.textConfig?.textDirection == TextDirection.rtl ? 0.0 : deep * (config?.leftSpacing ?? 10.0),
        right: config?.textConfig?.textDirection == TextDirection.rtl ? deep * (config?.leftSpacing ?? 10.0) : 0.0,
      ),
      child: Row(
        textDirection: config?.textConfig?.textDirection,
        crossAxisAlignment: config?.crossAxisAlignment ?? CrossAxisAlignment.start,
        children: <Widget>[
          _OlDot(deep: deep, index: index),
          Expanded(
            child: PWidget(
              children: otherTagNodes,
              parentNode: rootNode,
              textStyle: config?.textStyle ?? defaultPStyle,
              crossAxisAlignment: WrapCrossAlignment.start,
              textConfig: config?.textConfig,
            ),
          ),
        ],
      ),
    );
    listChildren.insert(0, config?.olWrapper?.call(olChild) ?? olChild);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listChildren,
    );
  }
}

///the index widget of orderly list
class _OlDot extends StatelessWidget {

  const _OlDot({
    required this.deep,
    required this.index,
  });
  final int deep;
  final int index;

  @override
  Widget build(BuildContext context) {
    final config = StyleConfig().olConfig;
    final Widget? configWidget = StyleConfig().olConfig?.indexWidget?.call(deep, index);

    return configWidget ??
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: config?.textConfig?.textDirection == TextDirection.rtl ? Text('.${index + 1}') : Text('${index + 1}.'),
        );
  }
}

///Config class for orderly list
class OlConfig {

  OlConfig({this.textStyle, this.textConfig, this.olWrapper, this.indexWidget, this.leftSpacing, this.selectable, this.crossAxisAlignment});
  final TextStyle? textStyle;
  final TextConfig? textConfig;
  final IndexWidget? indexWidget;
  final OlWrapper? olWrapper;
  final double? leftSpacing;
  final bool? selectable;
  final CrossAxisAlignment? crossAxisAlignment;
}

typedef IndexWidget = Widget Function(int deep, int index);
typedef OlWrapper = Widget Function(Widget child);
