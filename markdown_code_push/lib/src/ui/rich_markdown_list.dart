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

  String get sanitizedMarkup => sanitizeMarkup(markdownContent);

  Future<RichRenderer> get richRenderer async {
    // TODO(alphamikle): Fill WidgetConfig params for both instances, here and below
    final RichRenderer richRenderer = RichRenderer(widgetConfig: WidgetConfig());
    final List<TagRendererFactory> renderers = await renderer.renderers;
    for (final TagRendererFactory factory in renderers) {
      richRenderer.registerRenderer(await factory());
    }
    return richRenderer;
  }

  Future<MarkdownGenerator> createGenerator(BuildContext context) async {
    final RichRenderer richRenderer = await this.richRenderer;

    return MarkdownGenerator(
      context: context,
      data: sanitizedMarkup,
      // TODO(alphamikle): Style usual tags
      widgetConfig: createRichWidgetConfig(
        context: context,
        richRenderer: richRenderer,
      ),
      styleConfig: createRichStyleConfig(
        context: context,
        richRenderer: richRenderer,
      ),
      blockSyntaxes: [
        ...richRenderer.builders.values.map(tagRendererToBlockSyntax),
      ],
      formatters: [],
      widgetsFilter: widgetsFilter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ImageBuilderDelegate(
      loadingBuilder: imageLoadingBuilder,
      errorBuilder: imageErrorBuilder,
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
                      return FutureBuilder<MarkdownGenerator>(
                        // ignore: discarded_futures
                        future: createGenerator(context),
                        builder: (BuildContext context, AsyncSnapshot<MarkdownGenerator> asyncGenerator) {
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
