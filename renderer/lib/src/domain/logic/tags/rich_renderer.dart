import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:tools/tools.dart';

import '../template_logic/substitutor.dart';

class RichRenderer {
  RichRenderer({
    required this.widgetConfig,
  });

  final WidgetConfig widgetConfig;

  Map<Tag, TagRenderer> get builders => _builders;
  final Map<Tag, TagRenderer> _builders = {};

  void registerRenderer(TagRenderer renderer) => _builders[renderer.tag] = renderer;

  Future<Widget?> render(BuildContext context, md.Element element) async {
    try {
      return _builders[element.tag]!.builder(context, element, this);
    } catch (error, stackTrace) {
      logg('Got a error while rendering tag', error, stackTrace);
      return ErrorWidget(error);
    }
  }

  bool isRendererRegistered(String tag) => _builders.containsKey(tag);
}
