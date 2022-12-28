import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:markdown_code_push_core/src/config/widget_config.dart';
import 'package:markdown_code_push_core/src/tags/blockquote.dart';
import 'package:markdown_code_push_core/src/tags/hr.dart';
import 'package:markdown_code_push_core/src/tags/ol.dart';
import 'package:markdown_code_push_core/src/tags/p.dart';
import 'package:markdown_code_push_core/src/tags/pre.dart';
import 'package:markdown_code_push_core/src/tags/table.dart';
import 'package:markdown_code_push_core/src/tags/title.dart';
import 'package:markdown_code_push_core/src/tags/ul.dart';

class BaseTagsMapper {
  BaseTagsMapper({
    this.widgetConfig,
  });

  WidgetConfig? widgetConfig;

  ///h1~h6
  Widget? getTitleWidget(md.Node node, String tag) => TitleWidget(node: node as md.Element, tag: tag);

  ///p
  Future<Widget> getPWidget(md.Element node) async => await widgetConfig?.p?.call(node) ?? PWidget(children: node.children, parentNode: node);

  ///pre
  Future<Widget> getPreWidget(md.Node node) async => await widgetConfig?.pre?.call(node as md.Element) ?? PreWidget(node: node);

  ///ul
  Future<Widget> getUlWidget(md.Element node, int deep) async => await widgetConfig?.ul?.call(node) ?? ULWidget(rootNode: node, deep: deep);

  ///ol
  Future<Widget> getOlWidget(md.Element node, int deep) async => await widgetConfig?.ol?.call(node) ?? OLWidget(rootNode: node, deep: deep);

  ///blockquote
  Future<Widget> getBlockQuote(md.Element node) async => await widgetConfig?.block?.call(node) ?? BlockQuoteWidget(node: node);

  ///hr
  Future<Widget> getHrWidget(md.Element node) async => await widgetConfig?.hr?.call(node) ?? HrWidget(node: node);

  ///table
  Future<Widget> getTableWidget(md.Element node) async => await widgetConfig?.table?.call(node) ?? TableWidget(node: node);
}
