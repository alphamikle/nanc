import 'package:cms/src/domain/editor/logic/bloc/editor/editor_bloc.dart';
import 'package:cms/src/domain/editor/logic/bloc/editor/editor_state.dart';
import 'package:cms/src/domain/editor/logic/bloc/manual/manual_bloc.dart';
import 'package:cms/src/domain/editor/logic/bloc/manual/manual_state.dart';
import 'package:cms/src/domain/general/logic/model/menu_element.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_renderer/rich_renderer.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class ManualMenu extends StatefulWidget {
  const ManualMenu({
    super.key,
  });

  @override
  State<ManualMenu> createState() => _ManualMenuState();
}

class _ManualMenuState extends State<ManualMenu> {
  Future<List<TagRenderer>> prepareRenderers() async {
    final List<TagRendererFactory> allFactories = [...(await TagsRenderer().renderers)];
    final List<TagRenderer> renderers = [];

    for (final TagRendererFactory factory in allFactories) {
      final TagRenderer renderer = await factory();
      if (renderer.runtimeType == TagRenderer) {
        renderers.add(renderer);
      }
    }

    return renderers;
  }

  Future<List<TagRenderer>> get renderers async => prepareRenderers();

  Widget menuItemBuilder(BuildContext context, int index, TagRenderer renderer) {
    return BlocBuilder<EditorBloc, EditorState>(
      builder: (BuildContext context, EditorState state) {
        final ManualBloc manualBloc = context.read<EditorBloc>() as ManualBloc;
        final ManualState manualState = state as ManualState;
        final MenuElement element = MenuElement(title: capitalize(renderer.tag), url: renderer.tag);
        final bool isActive = element == manualState.activeElement;

        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? kPadding : 0, bottom: kPadding),
          child: KitMenuItem(
            text: element.title,
            icon: renderer.icon,
            onPressed: () => manualBloc.selectTag(element, renderer),
            isActive: isActive,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TagRenderer>>(
      future: renderers,
      builder: (BuildContext context, AsyncSnapshot<List<TagRenderer>> asyncRenderers) {
        if (asyncRenderers.hasData == false) {
          return const SizedBox();
        }
        final List<TagRenderer> renderers = asyncRenderers.requireData;

        return Material(
          type: MaterialType.transparency,
          child: ListView.builder(
            itemBuilder: (context, index) => menuItemBuilder(context, index, renderers[index]),
            itemCount: renderers.length,
          ),
        );
      },
    );
  }
}
