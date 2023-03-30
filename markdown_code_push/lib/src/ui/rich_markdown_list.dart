import 'package:flutter/material.dart';
import 'package:markdown_code_push_core/markdown_code_push_core.dart';
import 'package:rich_renderer/rich_renderer.dart';
import 'package:tools/tools.dart';

class RichMarkdownList extends StatelessWidget {
  const RichMarkdownList({
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

  RichRenderer get richRenderer {
    final RichRenderer richRenderer = RichRenderer(widgetConfig: WidgetConfig());
    final List<TagRendererFactory> renderers = renderer.renderers;
    for (final TagRendererFactory factory in renderers) {
      richRenderer.registerRenderer(factory());
    }
    return richRenderer;
  }

  MarkdownGeneratorV2 createGenerator(BuildContext context) {
    return MarkdownGeneratorV2(
      context: context,
      data: markdownContent,
      widgetConfig: createRichWidgetConfig(
        context: context,
        richRenderer: richRenderer,
      ),
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
            child: Builder(builder: (BuildContext context) {
              return TemplateStorage(
                child: Builder(
                  builder: (BuildContext context) {
                    final Widget preloader = this.preloader ??
                        const Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(),
                          ),
                        );
                    try {
                      return FutureBuilder<List<Widget>>(
                        // TODO(alphamikle): Use here a stream with async-generated widgets
                        // ignore: discarded_futures
                        future: createGenerator(context).generate(),
                        builder: (BuildContext context, AsyncSnapshot<List<Widget>> asyncWidgets) {
                          if (asyncWidgets.hasError) {
                            logg(asyncWidgets.error, asyncWidgets.stackTrace);
                            return ErrorWidget([asyncWidgets.error, asyncWidgets.stackTrace]);
                          }
                          if (asyncWidgets.hasData == false) {
                            return preloader;
                          }
                          final List<Widget> widgets = asyncWidgets.data ?? [];
                          // TODO(alphamikle): Подумать над тем, как можно оптимизировать моменты с отображением сливеров и не сливеров одновременно
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
                      );
                    } catch (error) {
                      logg(error);
                      return ErrorWidget(error);
                    }
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
