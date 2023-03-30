import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

/// you can use [WidgetConfig] to custom your tag widget
class WidgetConfig {
  WidgetConfig({
    this.p,
    this.pre,
    this.ul,
    this.ol,
    this.block,
    this.hr,
    this.table,
    this.custom = const <String, WidgetBuilder>{},
  });

  WidgetBuilder? p;
  WidgetBuilder? pre;
  WidgetBuilder? ul;
  WidgetBuilder? ol;
  WidgetBuilder? block;
  WidgetBuilder? hr;
  WidgetBuilder? table;
  Map<String, WidgetBuilder> custom;

  WidgetBuilder? builderForTag(String tag) => custom[tag];
}

typedef WidgetBuilder = Widget? Function(md.Element node);
