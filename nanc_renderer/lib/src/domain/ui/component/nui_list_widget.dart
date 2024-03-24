import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tag_converter/tag_converter.dart';
import 'package:tools/tools.dart';

import '../../../service/sliver_checker.dart';
import '../../logic/tags/logic/document_storage.dart';
import '../../logic/tags/logic/for_storage.dart';
import '../../logic/tags/logic/image_builder_delegate.dart';
import '../../logic/tags/logic/template_storage.dart';
import '../../logic/tags/rich_renderer.dart';
import '../../logic/tags/tag_renderer.dart';
import '../../logic/widget_generator/xml_widget_generator.dart';
import 'slivers_container.dart';

typedef PreloaderBuilder = Widget Function(AsyncSnapshot<GeneratorResult> snapshot, Widget? child);

class NuiListWidget extends StatelessWidget {
  const NuiListWidget({
    required this.xmlContent,
    required this.nodes,
    required this.binary,
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
    this.sliverChecker,
    super.key,
  }) : assert(xmlContent != null || nodes != null || binary != null);

  const NuiListWidget.xml({
    required String xml,
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
    this.sliverChecker,
    super.key,
  })  : xmlContent = xml,
        nodes = null,
        binary = null;

  const NuiListWidget.nodes({
    required List<TagNode> nodes,
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
    this.sliverChecker,
    super.key,
  })  : xmlContent = null,
        // ignore: prefer_initializing_formals
        nodes = nodes,
        binary = null;

  const NuiListWidget.binary({
    required Uint8List binary,
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
    this.sliverChecker,
    super.key,
  })  : xmlContent = null,
        nodes = null,
        // ignore: prefer_initializing_formals
        binary = binary;

  final String? xmlContent;
  final List<TagNode>? nodes;
  final Uint8List? binary;
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
  final SliverChecker? sliverChecker;

  XmlWidgetGenerator createGenerator(BuildContext context) {
    return XmlWidgetGenerator(
      context: context,
      data: xmlContent,
      nodes: nodes,
      binary: binary,
      richRenderer: RichRenderer(renderers: renderers),
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
      final bool sliver = isSliver(widget, checker: sliverChecker);
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
        child: DocumentStorage(
          data: pageData,
          child: TemplateStorage(
            child: Builder(
              builder: (BuildContext context) {
                final XmlWidgetGenerator generator = createGenerator(context);

                return asyncMode
                    ? FutureBuilder(
                        // ignore: discarded_futures
                        future: generator.generateAsync(),
                        builder: asyncBuilder,
                      )
                    : builder(generator.generate());
              },
            ),
          ),
        ),
      ),
    );
  }
}
