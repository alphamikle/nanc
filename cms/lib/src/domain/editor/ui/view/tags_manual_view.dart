import 'package:cms/cms.dart';
import 'package:cms/src/domain/editor/logic/bloc/manual/manual_state.dart';
import 'package:cms/src/domain/editor/ui/component/manual_menu.dart';
import 'package:cms/src/domain/editor/ui/component/page_editor.dart';
import 'package:cms/src/domain/editor/ui/component/tag_renderer_description.dart';
import 'package:cms/src/domain/general/ui/view/general_view_v2.dart';
import 'package:cms/src/domain/preview/ui/component/page_preview_with_frame.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class TagsManualView extends StatefulWidget {
  const TagsManualView({super.key});

  @override
  State<TagsManualView> createState() => _TagsManualViewState();
}

class _TagsManualViewState extends State<TagsManualView> {
  bool showDescription = true;

  void toggleDescription() => setState(() => showDescription = !showDescription);

  Widget tagDescription() {
    return BlocBuilder<EditorBloc, EditorState>(
      builder: (BuildContext context, EditorState state) {
        if (state is ManualState) {
          return Padding(
            padding: const EdgeInsets.only(
              top: Gap.regular,
              bottom: Gap.regular,
              left: Gap.large,
            ),
            child: TagRendererDescription(
              tagName: state.activeTagRenderer.tag,
              withChildren: true,
              description: state.activeTagRenderer.description,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// ? HEADER
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: kHeaderHeight,
            child: ColoredBox(
              color: context.theme.colorScheme.surfaceVariant,
              child: Padding(
                padding: const EdgeInsets.only(left: Gap.regular, right: Gap.regular),
                child: KitViewHeader(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: Gap.large),
                      child: KitIconButton(
                        icon: IconPack.flu_chevron_left_filled,
                        onPressed: () => context.navigator.pop(),
                      ),
                    ),
                    Text(
                      'Tags manual',
                      style: context.theme.textTheme.headline6,
                    ),
                    const Spacer(),

                    /// ? SWITCHER OF LIVE EDITOR / DESCRIPTION INFO
                    KitTooltip(
                      text: showDescription ? 'Switch to demo editor' : 'Switch to widget description',
                      child: KitIconButton(
                        icon: showDescription ? IconPack.mdi_file_xml_box : IconPack.flu_clipboard_text_ltr_filled,
                        onPressed: toggleDescription,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// ? SIDE MENU
          Positioned(
            left: 0,
            top: kHeaderHeight,
            bottom: 0,
            width: kMenuWidth,
            child: ColoredBox(
              color: context.theme.colorScheme.surfaceVariant,
              child: const ManualMenu(),
            ),
          ),

          /// ? LIVE EDITOR OR TAG DESCRIPTION WITH PREVIEW
          Positioned(
            left: kMenuWidth,
            top: kHeaderHeight,
            right: 0,
            bottom: 0,
            child: KitViewContainer(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Row(
                  children: [
                    /// ? EDITOR
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: Gap.regular,
                          bottom: Gap.regular,
                        ),
                        child: showDescription ? tagDescription() : const PageEditor(),
                      ),
                    ),

                    /// ? PREVIEW
                    const Padding(
                      padding: EdgeInsets.only(
                        left: kPadding,
                        top: kPadding,
                        right: kPadding,
                        bottom: kPadding,
                      ),
                      child: PagePreviewWithFrame(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
