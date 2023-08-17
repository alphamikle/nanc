import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../../cms.dart';
import '../../../../service/config/config.dart';
import '../../../general/ui/view/general_view_v2.dart';
import '../../../preview/ui/component/page_preview_with_frame.dart';
import '../component/manual_menu.dart';
import '../component/page_editor.dart';
import '../component/tag_renderer_description.dart';

class TagsManualView extends StatefulWidget {
  const TagsManualView({super.key});

  @override
  State<TagsManualView> createState() => _TagsManualViewState();
}

class _TagsManualViewState extends State<TagsManualView> {
  bool showDescription = true;
  final DataStorage dataStorage = DataStorage();

  void toggleDescription() => safeSetState(() => showDescription = !showDescription);

  Widget tagDescription() {
    return BlocBuilder<EditorBloc, EditorState>(
      builder: (BuildContext context, EditorState state) {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const double headerHeight = kHeaderHeight - 10;

    return Scaffold(
      body: Stack(
        children: [
          /// ? HEADER
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: headerHeight,
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
                    KitText(
                      text: 'Tags manual',
                      style: context.theme.textTheme.titleLarge,
                    ),
                    const Spacer(),

                    /// ? SWITCHERS
                    Padding(
                      padding: const EdgeInsets.only(right: Gap.regular),
                      child: BlocBuilder<EditorBloc, EditorState>(
                        builder: (BuildContext context, EditorState state) {
                          return KitTooltip(
                            text: state.asyncMode ? 'Switch to Sync Rendering Mode' : 'Switch to Async Rendering Mode',
                            child: KitIconButton(
                              icon: state.asyncMode ? IconPack.flu_arrow_counterclockwise_dashes_filled : IconPack.flu_arrow_clockwise_filled,
                              onPressed: context.read<EditorBloc>().toggleAsyncRendering,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: Gap.regular),
                      child: BlocBuilder<EditorBloc, EditorState>(
                        builder: (BuildContext context, EditorState state) {
                          String tooltip = state.contentType.isScrollable ? 'Switch to Stack Mode' : 'Switch to Scrollable Mode';
                          if (state.canChangeContentType == false) {
                            tooltip = 'Layout Mode changing is disabled for that widget';
                          }

                          return KitTooltip(
                            text: tooltip,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: state.canChangeContentType ? 1 : 0.5,
                              child: KitIconButton(
                                icon: state.canChangeContentType
                                    ? state.contentType.isScrollable
                                        ? IconPack.flu_stack_regular
                                        : IconPack.flu_dual_screen_vertical_scroll_regular
                                    : IconPack.mdi_progress_close,
                                onPressed: state.canChangeContentType ? context.read<EditorBloc>().toggleMode : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
            top: headerHeight,
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
            top: headerHeight,
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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kPadding,
                        top: kPadding,
                        right: kPadding,
                        bottom: kPadding,
                      ),
                      child: DataStorageProvider(
                        dataStorage: dataStorage,
                        child: const PagePreviewWithFrame(),
                      ),
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
