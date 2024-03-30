import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui/nui.dart';

import '../../../../service/config/config.dart';
import '../../../general/ui/view/general_view_v2.dart';
import '../../../preview/ui/component/page_preview_with_frame.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_icon_button.dart';
import '../../../ui_kit/domain/ui/components/kit_text.dart';
import '../../../ui_kit/domain/ui/components/kit_tooltip.dart';
import '../../../ui_kit/domain/ui/components/kit_view/kit_view_container.dart';
import '../../../ui_kit/domain/ui/components/kit_view/kit_view_header.dart';
import '../../logic/bloc/editor/editor_bloc.dart';
import '../../logic/bloc/editor/editor_state.dart';
import '../component/manual_menu.dart';
import '../component/page_editor.dart';
import '../component/tag_renderer_description.dart';

enum DisplayMode {
  docsWithPreview,
  xmlWithPreview,
  onlyDocs;

  bool get isDocsWithPreview => this == DisplayMode.docsWithPreview;
  bool get isXmlWithPreview => this == DisplayMode.xmlWithPreview;
  bool get isOnlyDocs => this == DisplayMode.onlyDocs;
  bool get isPreviewVisible => this == DisplayMode.docsWithPreview || this == DisplayMode.xmlWithPreview;
  bool get isDocsVisible => this == DisplayMode.docsWithPreview || this == DisplayMode.onlyDocs;

  String get title {
    return switch (this) {
      DisplayMode.docsWithPreview => 'Show XML',
      DisplayMode.xmlWithPreview => 'Show only docs',
      DisplayMode.onlyDocs => 'Show docs with preview',
    };
  }

  IconData get icon {
    return switch (this) {
      DisplayMode.docsWithPreview => IconPack.mdi_file_xml_box,
      DisplayMode.xmlWithPreview => IconPack.flu_document_bullet_list_cube_regular,
      DisplayMode.onlyDocs => IconPack.flu_clipboard_text_ltr_filled,
    };
  }
}

class TagsManualView extends StatefulWidget {
  const TagsManualView({super.key});

  @override
  State<TagsManualView> createState() => _TagsManualViewState();
}

class _TagsManualViewState extends State<TagsManualView> {
  DisplayMode mode = DisplayMode.docsWithPreview;
  final DataStorage dataStorage = DataStorage();

  void toggleDescription() => safeSetState(() {
        mode = switch (mode) {
          DisplayMode.docsWithPreview => DisplayMode.xmlWithPreview,
          DisplayMode.xmlWithPreview => DisplayMode.onlyDocs,
          DisplayMode.onlyDocs => DisplayMode.docsWithPreview,
        };
      });

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
                          final bool synced = state.isSyncedWithFile;

                          return KitTooltip(
                            text: synced ? 'Cancel file sync' : 'Sync editor with filesystem for getting more power',
                            child: KitIconButton(
                              color: synced ? context.theme.colorScheme.error : null,
                              icon: synced ? IconPack.flu_arrow_sync_checkmark_filled : IconPack.flu_arrow_sync_circle_filled,
                              onPressed: synced ? context.read<EditorBloc>().closeSync : context.read<EditorBloc>().syncWithFile,
                            ),
                          );
                        },
                      ),
                    ),
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
                      text: mode.title,
                      child: KitIconButton(
                        icon: mode.icon,
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
                        child: mode.isDocsVisible ? tagDescription() : const PageEditor(),
                      ),
                    ),

                    /// ? PREVIEW
                    if (mode.isPreviewVisible)
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
                      )
                    else
                      const SizedBox(width: kPadding)
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
