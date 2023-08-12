import 'package:flutter/material.dart';

import '../../logic/tags/logic/for_storage.dart';
import '../../logic/tags/logic/image_builder_delegate.dart';
import '../../logic/tags/logic/local_data.dart';
import '../../logic/tags/logic/page_data.dart';
import '../../logic/tags/logic/template_storage.dart';
import '../../logic/tags/rich_renderer.dart';
import '../../logic/tags/tag_renderer.dart';
import '../../logic/widget_generator/xml_widget_generator.dart';
import 'nui_list_widget.dart';

class NuiStackWidget extends StatelessWidget {
  const NuiStackWidget({
    required this.xmlContent,
    required this.renderers,
    required this.pageData,
    this.widgetsFilter,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    this.asyncMode = false,
    this.preloaderBuilder,
    super.key,
  });

  final String xmlContent;
  final List<TagRenderer> renderers;
  final Map<String, dynamic> pageData;
  final WidgetsFilter? widgetsFilter;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;
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
                      return asyncMode
                          ? FutureBuilder(
                              // ignore: discarded_futures
                              future: createGenerator(context).generateAsync(),
                              builder: asyncBuilder,
                            )
                          : builder(createGenerator(context).generate());
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
