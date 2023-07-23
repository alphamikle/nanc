import 'package:flutter/material.dart';

import '../../../../nanc_renderer.dart';
import 'xml_widgets_sliver_list.dart';
import 'xml_widgets_stack.dart';

enum NUIWidgetType {
  scrollable,
  stack;

  bool get isScrollable => this == NUIWidgetType.scrollable;
  bool get isStack => this == NUIWidgetType.stack;
}

class NUIWidget extends StatelessWidget {
  const NUIWidget({
    required this.xmlContent,
    required this.renderers,
    required this.pageData,
    required this.type,
    this.widgetsFilter,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    this.scrollController,
    super.key,
  });

  final NUIWidgetType type;
  final String xmlContent;
  final List<TagRenderer> renderers;
  final Map<String, dynamic> pageData;
  final WidgetsFilter? widgetsFilter;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return type.isScrollable
        ? XmlWidgetsSliverList(
            key: key,
            xmlContent: xmlContent,
            renderers: renderers,
            pageData: pageData,
            imageLoadingBuilder: imageLoadingBuilder,
            imageFrameBuilder: imageFrameBuilder,
            imageErrorBuilder: imageErrorBuilder,
            scrollController: scrollController,
            widgetsFilter: widgetsFilter,
          )
        : XmlWidgetsStack(
            key: key,
            xmlContent: xmlContent,
            renderers: renderers,
            pageData: pageData,
            imageLoadingBuilder: imageLoadingBuilder,
            imageFrameBuilder: imageFrameBuilder,
            imageErrorBuilder: imageErrorBuilder,
            widgetsFilter: widgetsFilter,
          );
  }
}
