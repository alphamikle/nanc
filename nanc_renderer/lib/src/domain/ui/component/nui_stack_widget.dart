import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nui_converter/nui_converter.dart';
import 'package:tools/tools.dart';

import '../../logic/tags/logic/document_storage.dart';
import '../../logic/tags/logic/for_storage.dart';
import '../../logic/tags/logic/image_builder_delegate.dart';
import '../../logic/tags/logic/template_storage.dart';
import '../../logic/tags/rich_renderer.dart';
import '../../logic/tags/tag_renderer.dart';
import '../../logic/widget_generator/xml_widget_generator.dart';
import 'nui_list_widget.dart';

class NuiStackWidget extends StatelessWidget {
  const NuiStackWidget({
    required this.xmlContent,
    required this.nodes,
    required this.binary,
    required this.renderers,
    required this.pageData,
    this.widgetsFilter,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    this.asyncMode = false,
    this.preloaderBuilder,
    super.key,
  }) : assert(xmlContent != null || nodes != null || binary != null);

  const NuiStackWidget.xml({
    required String xml,
    required this.renderers,
    required this.pageData,
    this.widgetsFilter,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    this.asyncMode = false,
    this.preloaderBuilder,
    super.key,
  })  : xmlContent = xml,
        nodes = null,
        binary = null;

  const NuiStackWidget.nodes({
    required List<TagNode> nodes,
    required this.renderers,
    required this.pageData,
    this.widgetsFilter,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    this.asyncMode = false,
    this.preloaderBuilder,
    super.key,
  })  : xmlContent = null,
        // ignore: prefer_initializing_formals
        nodes = nodes,
        binary = null;

  const NuiStackWidget.binary({
    required Uint8List binary,
    required this.renderers,
    required this.pageData,
    this.widgetsFilter,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    this.asyncMode = false,
    this.preloaderBuilder,
    super.key,
  })  : xmlContent = null,
        nodes = null,
        // ignore: prefer_initializing_formals
        binary = binary;

  final String? xmlContent;
  final List<TagNode>? nodes;
  final Uint8List? binary;
  final List<TagRenderer> renderers;
  final Json pageData;
  final WidgetsFilter? widgetsFilter;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;
  final bool asyncMode;
  final PreloaderBuilder? preloaderBuilder;

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
    final (List<Widget> widgets, bool _) = result;

    return Stack(
      fit: StackFit.expand,
      children: widgets,
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
          child: Builder(
            builder: (BuildContext context) {
              return TemplateStorage(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
