import 'package:additions/additions.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_state.dart';
import 'package:cms/src/domain/preview/logic/bloc/preview_bloc.dart';
import 'package:cms/src/domain/preview/logic/bloc/preview_state.dart';
import 'package:cms/src/service/init/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:rich_renderer/rich_renderer.dart';

class PagePreview extends StatefulWidget {
  const PagePreview({
    super.key,
  });

  @override
  State<PagePreview> createState() => _PagePreviewState();
}

class _PagePreviewState extends State<PagePreview> {
  late final TagsRenderer tagsRenderer = _prepareTagsRenderer();

  TagsRenderer _prepareTagsRenderer() {
    final TagsRenderer tagsRenderer = TagsRenderer();
    final DataRepository dataRepository = context.read();
    for (final TagRendererFactory renderer in dataRepository.renderers) {
      tagsRenderer.registerRenderer(renderer);
    }
    return tagsRenderer;
  }

  @override
  Widget build(BuildContext context) {
    final DataRepository dataRepository = context.read();

    return ClickDelegate(
      onPressed: clickHandler(context: context, handlers: dataRepository.clickHandlers),
      child: BlocBuilder<BasePageBloc, BaseEntityPageState>(
        builder: (BuildContext context, BaseEntityPageState pageState) {
          return BlocBuilder<PreviewBloc, PreviewState>(
            builder: (BuildContext context, PreviewState previewState) {
              return RichMarkdownList(
                scrollController: context.read<PreviewBloc>().scrollController,
                markdownContent: previewState.markdownContent,
                pageData: pageState.data,
                renderer: tagsRenderer,
                widgetsFilter: forWidgetFilter,
                imageLoadingBuilder: dataRepository.imageLoadingBuilder,
                imageErrorBuilder: dataRepository.imageErrorBuilder,
                imageFrameBuilder: dataRepository.imageFrameBuilder,
              );
            },
          );
        },
      ),
    );
  }
}
