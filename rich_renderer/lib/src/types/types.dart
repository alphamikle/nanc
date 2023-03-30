import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/property/property_widget.dart';

typedef MarkdownWidgetBuilder = Widget? Function(BuildContext context, md.Element element, RichRenderer renderer);
typedef TagRendererFactory = TagRenderer Function();
typedef PropertyWidgetFactory = PropertyWidget<Object?> Function();
