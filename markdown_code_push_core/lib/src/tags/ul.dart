import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;
import 'package:markdown_code_push_core/src/config/style_config.dart';
import 'package:markdown_code_push_core/src/tags/markdown_tags.dart';
import 'package:markdown_code_push_core/src/tags/ol.dart';
import 'package:markdown_code_push_core/src/tags/p.dart';

///the unOrderly list widget
class ULWidget extends StatelessWidget {
  const ULWidget({
    required this.rootNode,
    required this.deep,
    super.key,
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
            if (node.tag == ul) return ULWidget(rootNode: node, deep: deep + 1);
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
    // super.key,
  });

  final m.Element rootNode;
  final int deep;
  final int index;

  @override
  Widget build(BuildContext context) {
    final children = rootNode.children ?? [];
    final List<m.Node> otherTagNodes = [];
    final isSolid = deep.isEven;
    final List<Widget> listChildren = [];
    for (final node in children) {
      if (node is m.Element && node.tag == ul) {
        final child = ULWidget(rootNode: node, deep: deep + 1);
        listChildren.add(child);
      } else if (node is m.Element && node.tag == ol) {
        final child = OLWidget(rootNode: node, deep: deep + 1);
        listChildren.add(child);
      } else {
        otherTagNodes.add(node);
      }
    }
    final config = StyleConfig().ulConfig;
    final Widget? dotWidget = StyleConfig().ulConfig?.dotWidget?.call(deep, index);
    final ulChild = Container(
      margin: EdgeInsets.only(
          left: config?.textConfig?.textDirection == TextDirection.rtl ? 0.0 : deep * (config?.leftSpacing ?? 10.0),
          right: config?.textConfig?.textDirection == TextDirection.rtl ? deep * (config?.leftSpacing ?? 10.0) : 0.0),
      child: Row(
        textDirection: config?.textConfig?.textDirection,
        crossAxisAlignment: config?.crossAxisAlignment ?? CrossAxisAlignment.start,
        children: <Widget>[
          dotWidget ?? _UlDot(isSolid: isSolid),
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
    listChildren.insert(0, config?.ulWrapper?.call(ulChild) ?? ulChild);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listChildren,
    );
  }
}

///the index widget of unOrderly list
class _UlDot extends StatelessWidget {
  const _UlDot({
    required this.isSolid,
    // super.key,
  });

  final bool isSolid;

  @override
  Widget build(BuildContext context) {
    final config = StyleConfig().ulConfig;
    final dotSize = config?.dotSize ?? 6;
    final marginTop = (config?.textStyle?.fontSize ?? defaultPStyle?.fontSize ?? 14) / 2;

    return Container(
      width: dotSize,
      height: dotSize,
      margin: config?.dotMargin ?? EdgeInsets.only(left: 5, right: 5, top: marginTop),
      decoration: BoxDecoration(
        border: isSolid ? null : Border.all(color: defaultUlDotColor!),
        shape: BoxShape.circle,
        color: isSolid ? defaultUlDotColor : null,
      ),
    );
  }
}

///Config class for unOrderly list
class UlConfig {
  UlConfig({
    this.textStyle,
    this.textConfig,
    this.dotWidget,
    this.ulWrapper,
    this.leftSpacing,
    this.selectable,
    this.crossAxisAlignment,
    this.dotSize,
    this.dotMargin,
  });

  final TextStyle? textStyle;
  final TextConfig? textConfig;
  final DotWidget? dotWidget;
  final UlWrapper? ulWrapper;
  final double? leftSpacing;
  final double? dotSize;
  final bool? selectable;
  final EdgeInsetsGeometry? dotMargin;
  final CrossAxisAlignment? crossAxisAlignment;
}

typedef DotWidget = Widget Function(int deep, int index);
typedef UlWrapper = Widget Function(Widget child);
