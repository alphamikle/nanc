import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_state.dart';
import 'package:cms/src/domain/preview/logic/bloc/preview_bloc.dart';
import 'package:cms/src/domain/preview/logic/bloc/preview_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdown_code_push/markdown_code_push.dart';
import 'package:rich_renderer/rich_renderer.dart';
import 'package:tools/tools.dart';

final RegExp _snackBarRegExp = RegExp(r'^snackbar: ?(?<content>.*)$');

// TODO(alphamikle): Add possibility to pass custom ClickDelegate to the CMS from the user side
class PagePreview extends StatelessWidget {
  const PagePreview({
    super.key,
  });

  void _clickHandler(BuildContext context, String event) {
    logg('Got a new event: $event');
    final RegExpMatch? snackbarMatch = _snackBarRegExp.firstMatch(event);
    if (snackbarMatch != null) {
      final String content = snackbarMatch.namedGroup('content')!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(content),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClickDelegate(
      onPressed: (String event) => _clickHandler(context, event),
      child: BlocBuilder<BasePageBloc, BaseEntityPageState>(
        builder: (BuildContext context, BaseEntityPageState pageState) {
          return BlocBuilder<PreviewBloc, PreviewState>(
            builder: (BuildContext context, PreviewState previewState) {
              return RichMarkdownList(
                scrollController: context.read<PreviewBloc>().scrollController,
                markdownContent: previewState.markdownContent,
                pageData: pageState.data,
                // TODO(alphamikle): ADD CUSTOM TAGS POSSIBILITY
                renderer: TagsRenderer(),
              );
            },
          );
        },
      ),
    );
  }
}
