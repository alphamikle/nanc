import 'package:flutter/material.dart';
import 'package:markdown_code_push_core/markdown_code_push_core.dart';
import 'package:rich_renderer/rich_renderer.dart';

typedef WidgetsFilter = void Function(Widget widget, List<Widget> output);

class XmlWidgetsSliverList extends StatelessWidget {
  const XmlWidgetsSliverList({
    required this.markdownContent,
    required this.renderer,
    required this.pageData,
    this.preloader,
    this.scrollController,
    this.widgetsFilter,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    super.key,
  });

  final String markdownContent;
  final TagsRenderer renderer;
  final ScrollController? scrollController;
  final Widget? preloader;
  final Map<String, dynamic> pageData;
  final WidgetsFilter? widgetsFilter;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;

  RichRenderer get richRenderer => RichRenderer(
        renderers: renderer.renderers.map(
          (TagRendererFactory it) => it(),
        ),
      );

  XmlWidgetGenerator createGenerator(BuildContext context) {
    return XmlWidgetGenerator(
      context: context,
      data: markdownContent,
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
