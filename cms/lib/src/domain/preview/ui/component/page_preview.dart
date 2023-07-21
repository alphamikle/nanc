import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

import '../../../../service/init/data_repository.dart';
import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../document/logic/bloc/base_document_bloc/base_page_state.dart';
import '../../logic/bloc/preview_bloc.dart';
import '../../logic/bloc/preview_state.dart';

class PagePreview extends StatelessWidget {
  const PagePreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DataRepository dataRepository = context.read();

    return ClickDelegate(
      handlers: dataRepository.clickHandlers,
      child: BlocBuilder<BaseDocumentBloc, BaseDocumentState>(
        builder: (BuildContext context, BaseDocumentState pageState) {
          return BlocBuilder<PreviewBloc, PreviewState>(
            builder: (BuildContext context, PreviewState previewState) {
              final bool isScrollable = previewState.contentType.isScrollable;
              if (isScrollable) {
                return XmlWidgetsSliverList(
                  scrollController: context.read<PreviewBloc>().scrollController,
                  xmlContent: previewState.markdownContent,
                  pageData: pageState.data,
                  renderers: dataRepository.renderers,
                  imageLoadingBuilder: dataRepository.imageLoadingBuilder,
                  imageErrorBuilder: dataRepository.imageErrorBuilder,
                  imageFrameBuilder: dataRepository.imageFrameBuilder,
                );
              }
              return XmlWidgetsStack(
                xmlContent: previewState.markdownContent,
                pageData: pageState.data,
                renderers: dataRepository.renderers,
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
