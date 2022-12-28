import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_client/logic/bloc/page_bloc.dart';
import 'package:nanc_client/logic/bloc/page_state.dart';
import 'package:nanc_client/ui/components/connection_modal.dart';
import 'package:nanc_client/ui/components/content_page.dart';
import 'package:rich_renderer/rich_renderer.dart';
import 'package:tools/tools.dart';

class MainView extends StatefulWidget {
  const MainView({
    required this.isRoot,
    super.key,
  });

  final bool isRoot;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final TextEditingController offerTextController = TextEditingController();
  final TextEditingController answerTextController = TextEditingController();

  Future<void> showConnectionManager() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => const ConnectionModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PageBloc, PageState>(
        builder: (BuildContext context, PageState state) {
          return ContentPage(
            content: state.screenData,
            pageData: state.pageData,
            renderer: TagsRenderer(),
          );
        },
      ),
      floatingActionButton: BlocBuilder<PageBloc, PageState>(
        builder: (BuildContext context, PageState state) {
          String fabText = 'Connect to NANC';
          Color fabColor = context.theme.colorScheme.tertiary;
          if (state.isConnectingToTheBackend) {
            fabText = 'Connecting...';
            fabColor = context.theme.colorScheme.outline;
          }
          if (state.isConnectedToTheBackend) {
            fabText = 'Disconnect from NANC';
            fabColor = context.theme.colorScheme.error;
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: FloatingActionButton(
              key: ValueKey(fabText),
              backgroundColor: fabColor,
              onPressed: showConnectionManager,
              tooltip: fabText,
              child: Icon(
                MdiIcons.connection,
                color: context.theme.colorScheme.onTertiary,
              ),
            ),
          );
        },
      ),
    );
  }
}
