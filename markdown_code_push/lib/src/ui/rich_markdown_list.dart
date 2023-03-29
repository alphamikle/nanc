import 'package:flutter/material.dart';
import 'package:markdown_code_push/src/mapper/tag_mapper.dart';
import 'package:markdown_code_push/src/tools/markup_sanitizer.dart';
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

  Future<RichRenderer> get richRenderer async {
    // TODO(alphamikle): Fill WidgetConfig params for both instances, here and below
    final RichRenderer richRenderer = RichRenderer(widgetConfig: WidgetConfig());
    final List<TagRendererFactory> renderers = await renderer.renderers;
    for (final TagRendererFactory factory in renderers) {
      richRenderer.registerRenderer(await factory());
    }
    return richRenderer;
  }

  Future<MarkdownGeneratorV2> createGenerator(BuildContext context) async {
    final RichRenderer richRenderer = await this.richRenderer;
    final bool useOld = false;

    if (useOld) {
      return MarkdownGeneratorV2.old(
        context: context,
        data: sanitizeMarkup(markdownContent),
        // TODO(alphamikle): Style usual tags
        // ignore: use_build_context_synchronously
        widgetConfig: createRichWidgetConfig(
          context: context,
          richRenderer: richRenderer,
        ),
        // ignore: use_build_context_synchronously
        styleConfig: createRichStyleConfig(
          context: context,
          richRenderer: richRenderer,
        ),
        blockSyntaxes: [
          ...richRenderer.builders.values.map(tagRendererToBlockSyntax),
        ],
        widgetsFilter: widgetsFilter,
      );
    }

    // ignore: use_build_context_synchronously
    return MarkdownGeneratorV2(
      context: context,
      data: markdownContent,
      // TODO(alphamikle): Style usual tags
      // ignore: use_build_context_synchronously
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
                      return FutureBuilder<MarkdownGeneratorV2>(
                        // ignore: discarded_futures
                        future: createGenerator(context),
                        builder: (BuildContext context, AsyncSnapshot<MarkdownGeneratorV2> asyncGenerator) {
                          if (asyncGenerator.hasError) {
                            return ErrorWidget(asyncGenerator.error!);
                          }
                          if (asyncGenerator.hasData == false) {
                            return preloader;
                          }
                          return FutureBuilder<List<Widget>>(
                            // TODO(alphamikle): Use here a stream with async-generated widgets
                            // ignore: discarded_futures
                            future: asyncGenerator.requireData.generate(),
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
