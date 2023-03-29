import 'package:flutter/material.dart';
import 'package:renderer/src/domain/logic/template_logic/for_storage.dart';
import 'package:renderer/src/domain/logic/template_logic/image_builder_delegate.dart';
import 'package:renderer/src/domain/logic/template_logic/local_data.dart';
import 'package:renderer/src/domain/logic/template_logic/page_data.dart';
import 'package:renderer/src/domain/logic/template_logic/template_storage.dart';
import 'package:renderer/src/domain/logic/widgets_xml_generator/widgets_xml_generator.dart';
import 'package:tools/tools.dart';

typedef DataContext = Map<String, dynamic>;

class XmlWidgetsList extends StatelessWidget {
  factory XmlWidgetsList({
    required String xmlContent,
    required DataContext dataContext,
    WidgetsXmlGenerator? generator,
    Widget? preloader,
    ScrollController? scrollController,
    final ImageLoadingBuilder? imageLoadingBuilder,
    final ImageErrorWidgetBuilder? imageErrorBuilder,
    final ImageFrameBuilder? imageFrameBuilder,
    Key? key,
  }) {
    return XmlWidgetsList._(
      dataContext: dataContext,
      generator: generator ?? defaultWidgetsXmlGeneratorFactory(xmlContent),
      preloader: preloader,
      scrollController: scrollController,
      imageLoadingBuilder: imageLoadingBuilder,
      imageErrorBuilder: imageErrorBuilder,
      imageFrameBuilder: imageFrameBuilder,
      key: key,
    );
  }

  const XmlWidgetsList._({
    required this.dataContext,
    required this.generator,
    this.preloader,
    this.scrollController,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    super.key,
  });

  final WidgetsXmlGenerator generator;
  final ScrollController? scrollController;
  final Widget? preloader;
  final DataContext dataContext;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;

  @override
  Widget build(BuildContext context) {
    return ImageBuilderDelegate(
      loadingBuilder: imageLoadingBuilder,
      errorBuilder: imageErrorBuilder,
      frameBuilder: imageFrameBuilder,
      child: ForStorage(
        child: PageData(
          data: dataContext,
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
