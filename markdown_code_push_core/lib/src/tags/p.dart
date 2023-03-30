import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;
import 'package:markdown_code_push_core/src/config/style_config.dart';
import 'package:markdown_code_push_core/src/tags/common.dart';

///Tag:  p
///the paragraph widget
class PWidget extends StatelessWidget {

  const PWidget({
    super.key,
    this.children,
    required this.parentNode,
    this.textStyle,
    this.textConfig,
    this.crossAxisAlignment = WrapCrossAlignment.center,
  });
  final List<m.Node>? children;
  final m.Node parentNode;
  final TextStyle? textStyle;
  final TextConfig? textConfig;
  final WrapCrossAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return buildRichText(children, parentNode, textStyle, textConfig, context);
  }

  Widget buildRichText(List<m.Node>? children, m.Node parentNode, TextStyle? textStyle, TextConfig? textConfig, BuildContext context) {
    final config = StyleConfig().pConfig;
    return Text.rich(
      getBlockSpan(children, parentNode, textStyle ?? config?.textStyle ?? defaultPStyle),
      textAlign: textConfig?.textAlign ?? config?.textConfig?.textAlign ?? TextAlign.start,
      textDirection: textConfig?.textDirection ?? config?.textConfig?.textDirection,
    );
  }
}

///config class for [PWidget]
class PConfig {

  PConfig({
    this.textStyle,
    this.linkStyle,
    this.delStyle,
    this.emStyle,
    this.strongStyle,
    this.textConfig,
    this.onLinkTap,
    this.custom,
  });
  final TextStyle? textStyle;
  final TextStyle? linkStyle;
  final TextStyle? delStyle;
  final TextStyle? emStyle;
  final TextStyle? strongStyle;
  final TextConfig? textConfig;
  final OnLinkTap? onLinkTap;
  final Custom? custom;
}

///config class for [TextStyle]
class TextConfig {

  TextConfig({this.textAlign, this.textDirection});
  final TextAlign? textAlign;
  final TextDirection? textDirection;
}

typedef OnLinkTap = void Function(String? url);
typedef LinkGesture = Widget Function(Widget linkWidget, String? url);
typedef Custom = Widget Function(m.Element element);
