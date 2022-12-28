import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;
import 'package:markdown_code_push_core/src/config/style_config.dart';
import 'package:markdown_code_push_core/src/tags/markdown_tags.dart';
import 'package:markdown_code_push_core/src/tags/p.dart';

///Tag: h1~h6
///the title widget
class TitleWidget extends StatelessWidget {
  const TitleWidget({
    required this.node,
    required this.tag,
    super.key,
  });

  final m.Element node;
  final String tag;

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Container();
    switch (tag) {
      case h1:
        titleWidget = _TextWithDivider(node: node, style: _titleStyle(28), tag: h1);
        break;
      case h2:
        titleWidget = _TextWithDivider(node: node, style: _titleStyle(25), tag: h2);

        break;
      case h3:
        titleWidget = _TextWithDivider(node: node, style: _titleStyle(22), tag: h3);

        break;
      case h4:
        titleWidget = _TextWithDivider(node: node, style: _titleStyle(19), tag: h4);

        break;
      case h5:
        titleWidget = _TextWithDivider(node: node, style: _titleStyle(17), tag: h5);

        break;
      case h6:
        titleWidget = _TextWithDivider(node: node, style: _titleStyle(12), tag: h6);

        break;
    }
    return titleWidget;
  }

  TextStyle _titleStyle(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: defaultTitleColor,
      );
}

///divider widget
class _Divider extends StatelessWidget {
  const _Divider(/*{
    super.key,
  }*/
      );

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: defaultDividerColor);
  }
}

///the divider and title text widget
class _TextWithDivider extends StatelessWidget {
  const _TextWithDivider({
    required this.node,
    required this.style,
    required this.tag,
    // super.key,
  });

  final m.Element node;
  final TextStyle style;
  final String tag;

  @override
  Widget build(BuildContext context) {
    final config = StyleConfig().titleConfig;
    final bool showDivider = config?.showDivider ?? true;
    TextStyle? configStyle;
    switch (tag) {
      case h1:
        configStyle = config?.h1;
        break;
      case h2:
        configStyle = config?.h2;
        break;
      case h3:
        configStyle = config?.h3;
        break;
      case h4:
        configStyle = config?.h4;
        break;
      case h5:
        configStyle = config?.h5;
        break;
      case h6:
        configStyle = config?.h6;
        break;
    }
    final child = PWidget(
      children: node.children,
      parentNode: node,
      textStyle: (configStyle ?? style).merge(config?.commonStyle),
      textConfig: config?.textConfig,
    );
    final title = config?.titleWrapper?.call(child) ?? child;

    return showDivider
        ? Column(
            crossAxisAlignment: config?.textConfig?.textDirection == TextDirection.rtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              title,
              SizedBox(height: config?.space ?? 4.0),
              config?.divider ?? const _Divider(),
            ],
          )
        : title;
  }
}

///config class for [TitleWidget]
class TitleConfig {
  TitleConfig({this.h1, this.h2, this.h3, this.h4, this.h5, this.h6, this.commonStyle, this.textConfig, this.titleWrapper, this.showDivider, this.divider, this.space});

  final TextStyle? h1;
  final TextStyle? h2;
  final TextStyle? h3;
  final TextStyle? h4;
  final TextStyle? h5;
  final TextStyle? h6;
  final TextStyle? commonStyle;
  final TextConfig? textConfig;
  final TitleWrapper? titleWrapper;
  final bool? showDivider;
  final Widget? divider;
  final double? space;
}

typedef TitleWrapper = Widget Function(Widget title);
