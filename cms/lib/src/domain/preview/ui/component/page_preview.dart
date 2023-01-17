import 'package:additions/additions.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_state.dart';
import 'package:cms/src/domain/preview/logic/bloc/preview_bloc.dart';
import 'package:cms/src/domain/preview/logic/bloc/preview_state.dart';
import 'package:cms/src/service/init/%20data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdown_code_push/markdown_code_push.dart';
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
    return ClickDelegate(
      onPressed: clickHandler(context: context, handlers: context.read<DataRepository>().clickHandlers),
      child: BlocBuilder<BasePageBloc, BaseEntityPageState>(
        builder: (BuildContext context, BaseEntityPageState pageState) {
          return BlocBuilder<PreviewBloc, PreviewState>(
            builder: (BuildContext context, PreviewState previewState) {
              return RichMarkdownList(
                scrollController: context.read<PreviewBloc>().scrollController,
                markdownContent: previewState.markdownContent,
                pageData: pageState.data,
                renderer: tagsRenderer,
              );
            },
          );
        },
      ),
    );
  }
}
