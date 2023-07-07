import 'package:flutter/material.dart';

import '../../logic/tags/logic/for_storage.dart';
import '../../logic/tags/logic/image_builder_delegate.dart';
import '../../logic/tags/logic/local_data.dart';
import '../../logic/tags/logic/page_data.dart';
import '../../logic/tags/logic/template_storage.dart';
import '../../logic/tags/rich_renderer.dart';
import '../../logic/tags/tag_renderer.dart';
import '../../logic/widget_generator/xml_widget_generator.dart';

typedef WidgetsFilter = void Function(Widget widget, List<Widget> output);

class XmlWidgetsSliverList extends StatelessWidget {
  const XmlWidgetsSliverList({
    required this.xmlContent,
    required this.renderers,
    required this.pageData,
    this.scrollController,
    this.widgetsFilter,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    super.key,
  });

  final String xmlContent;
  final List<TagRenderer> renderers;
  final ScrollController? scrollController;
  final Map<String, dynamic> pageData;
  final WidgetsFilter? widgetsFilter;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;

  RichRenderer get richRenderer => RichRenderer(renderers: renderers);

  XmlWidgetGenerator createGenerator(BuildContext context) {
    return XmlWidgetGenerator(
      context: context,
      data: xmlContent,
      richRenderer: richRenderer,
      widgetsFilter: widgetsFilter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ImageBuilderDelegate(
      loadingBuilder: imageLoadingBuilder,
      errorBuilder: imageErrorBuilder,
      frameBuilder: imageFrameBuilder,
      child: ForStorage(
        child: PageData(
          data: pageData,
          child: LocalData(
            // ignore: prefer_const_literals_to_create_immutables
            data: {},
            child: Builder(
              builder: (BuildContext context) {
                return TemplateStorage(
                  child: Builder(
                    builder: (BuildContext context) {
                      final List<Widget> widgets = createGenerator(context).generate();
                      return CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) => widgets[index],
                              childCount: widgets.length,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
