import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import '../renderers/property/property_widget.dart';
import '../rich_renderer.dart';
import '../tag_renderer.dart';

typedef MarkdownWidgetBuilder = Widget? Function(BuildContext context, md.Element element, RichRenderer renderer);
typedef TagRendererFactory = TagRenderer Function();
typedef PropertyWidgetFactory = PropertyWidget<Object?> Function();
