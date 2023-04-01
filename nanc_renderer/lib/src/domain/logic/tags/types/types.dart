import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';

typedef MarkdownWidgetBuilder = Widget? Function(BuildContext context, md.Element element, RichRenderer renderer);
typedef TagRendererFactory = TagRenderer Function();
typedef PropertyWidgetFactory = PropertyWidget<Object?> Function();
