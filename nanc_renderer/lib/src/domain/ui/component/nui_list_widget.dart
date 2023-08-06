import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../logic/tags/logic/for_storage.dart';
import '../../logic/tags/logic/image_builder_delegate.dart';
import '../../logic/tags/logic/local_data.dart';
import '../../logic/tags/logic/page_data.dart';
import '../../logic/tags/logic/template_storage.dart';
import '../../logic/tags/rich_renderer.dart';
import '../../logic/tags/tag_renderer.dart';
import '../../logic/widget_generator/sliver_checker.dart';
import '../../logic/widget_generator/xml_widget_generator.dart';
import 'slivers_container.dart';

typedef PreloaderBuilder = Widget Function(AsyncSnapshot<GeneratorResult> snapshot, Widget? child);

class NuiListWidget extends StatelessWidget {
  const NuiListWidget({
    required this.xmlContent,
    required this.renderers,
    required this.pageData,
    this.scrollController,
    this.widgetsFilter,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    this.physics,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.cacheExtent,
    this.shrinkWrap = false,
    this.asyncMode = false,
    this.preloaderBuilder,
    super.key,
  });

  final String xmlContent;
  final List<TagRenderer> renderers;
  final ScrollController? scrollController;
  final Json pageData;
  final WidgetsFilter? widgetsFilter;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;
  final ScrollPhysics? physics;
  final bool reverse;
  final Axis scrollDirection;
  final double? cacheExtent;
  final bool shrinkWrap;
  final bool asyncMode;
  final PreloaderBuilder? preloaderBuilder;

  RichRenderer get richRenderer => RichRenderer(renderers: renderers);

  XmlWidgetGenerator createGenerator(BuildContext context) {
    return XmlWidgetGenerator(
      context: context,
      data: xmlContent,
      richRenderer: richRenderer,
      widgetsFilter: widgetsFilter,
    );
  }

  List<Widget> buildSliversContainer(SliversContainer container) {
    if (container.isSlivers) {
      return container.widgets;
    }
    return [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => container.widgets[index],
          childCount: container.widgets.length,
        ),
      ),
    ];
  }

  Widget asyncBuilder(BuildContext context, AsyncSnapshot<GeneratorResult> snapshot) {
    final Widget? child = snapshot.hasError || snapshot.hasData == false ? null : builder(snapshot.requireData);
    if (preloaderBuilder != null) {
      return preloaderBuilder!(snapshot, child);
    }
    if (snapshot.hasError) {
      return ErrorWidget(snapshot.error!);
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: snapshot.hasData
          ? child!
          : const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  Widget builder(GeneratorResult result) {
    final (List<Widget> widgets, bool hasSlivers) = result;

    if (hasSlivers == false) {
      return CustomScrollView(
        physics: physics,
        reverse: reverse,
        scrollDirection: scrollDirection,
        cacheExtent: cacheExtent,
        shrinkWrap: shrinkWrap,
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
    }
    final List<SliversContainer> containers = [];
    for (final Widget widget in widgets) {
      final bool sliver = isSliver(widget);
      final bool previousContainerTheSame = containers.isEmpty ? false : containers.last.isSlivers == sliver;
      if (previousContainerTheSame) {
        containers.last.widgets.add(widget);
      } else {
        containers.add(SliversContainer(widgets: [widget], isSlivers: sliver));
      }
    }

    return CustomScrollView(
      physics: physics,
      reverse: reverse,
      scrollDirection: scrollDirection,
      cacheExtent: cacheExtent,
      shrinkWrap: shrinkWrap,
      controller: scrollController,
      slivers: [
        for (final SliversContainer container in containers) ...buildSliversContainer(container),
      ],
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
                  child: asyncMode
                      ? FutureBuilder(
                          // ignore: discarded_futures
                          future: createGenerator(context).generateAsync(),
                          builder: asyncBuilder,
                        )
                      : builder(createGenerator(context).generate()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
