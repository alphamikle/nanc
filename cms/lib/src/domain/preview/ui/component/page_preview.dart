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

    return EventDelegate(
      handlers: dataRepository.eventsHandlers,
      child: BlocBuilder<BaseDocumentBloc, BaseDocumentState>(
        builder: (BuildContext context, BaseDocumentState pageState) {
          return BlocBuilder<PreviewBloc, PreviewState>(
            builder: (BuildContext context, PreviewState previewState) {
              final bool isScrollable = previewState.contentType.isScrollable;
              final bool asyncMode = previewState.asyncMode;

              if (isScrollable) {
                return NuiListWidget(
                  scrollController: context.read<PreviewBloc>().scrollController,
                  xmlContent: previewState.xmlContent,
                  pageData: pageState.data,
                  renderers: dataRepository.renderers,
                  imageLoadingBuilder: dataRepository.imageLoadingBuilder,
                  imageErrorBuilder: dataRepository.imageErrorBuilder,
                  imageFrameBuilder: dataRepository.imageFrameBuilder,
                  physics: const BouncingScrollPhysics(),
                  asyncMode: asyncMode,
                );
              }
              return NuiStackWidget(
                xmlContent: previewState.xmlContent,
                pageData: pageState.data,
                renderers: dataRepository.renderers,
                imageLoadingBuilder: dataRepository.imageLoadingBuilder,
                imageErrorBuilder: dataRepository.imageErrorBuilder,
                imageFrameBuilder: dataRepository.imageFrameBuilder,
                asyncMode: asyncMode,
              );
            },
          );
        },
      ),
    );
  }
}
