import 'dart:async';

import 'package:cms/src/domain/editor/logic/bloc/editor/editor_bloc.dart';
import 'package:cms/src/domain/editor/logic/bloc/editor/editor_state.dart';
import 'package:cms/src/domain/editor/logic/bloc/manual/manual_bloc.dart';
import 'package:cms/src/domain/editor/ui/component/page_editor.dart';
import 'package:cms/src/domain/editor/ui/view/page_data_preview.dart';
import 'package:cms/src/domain/editor/ui/view/tags_manual_view.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_state.dart';
import 'package:cms/src/domain/preview/logic/bloc/preview_bloc.dart';
import 'package:cms/src/domain/preview/ui/component/page_preview_with_frame.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:fields/fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class ScreenEditor extends FieldCellWidget<ScreenField> {
  const ScreenEditor({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<ScreenEditor> createState() => _ScreenEditorState();
}

class _ScreenEditorState extends State<ScreenEditor> with FieldCellHelper<ScreenField, ScreenEditor> {
  late final StreamSubscription<EditorState> subscription;
  final EventBus localEventBus = EventBus();
  late final ManualBloc manualBloc = ManualBloc(eventBus: localEventBus, patternMap: context.read<EditorBloc>().patternMap);
  late final PreviewBloc previewBloc = PreviewBloc(eventBus: localEventBus);
  bool isPageJsonAvailable = false;

  void toggleJsonView() => setState(() => isPageJsonAvailable = !isPageJsonAvailable);

  Widget manualBuilder(BuildContext context, CloseContainerActionCallback<String> action) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditorBloc>.value(value: manualBloc),
        BlocProvider<PreviewBloc>.value(value: previewBloc),
      ],
      child: const TagsManualView(),
    );
  }

  void onScreenContentChange(EditorState state) {
    pageBloc.updateValue(
      fieldId,
      ScreenContentModel(
        content: state.markdownContent,
        contentType: field.isScrollable ? ScreenContentType.scrollable : ScreenContentType.freeform,
      ).toJson(),
    );
  }

  Future<void> preload() async {
    final EditorBloc editorBloc = context.read();
    subscription = editorBloc.stream.listen(onScreenContentChange);
  }

  @override
  void initState() {
    super.initState();
    unawaited(preload());
  }

  @override
  void dispose() {
    unawaited(subscription.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KitScreenPreloader(
      delayBeforeBuildChild: const Duration(milliseconds: 800),
      builder: (_) => ColoredBox(
        color: context.theme.colorScheme.surfaceVariant,
        child: KitColumn(
          children: [
            /// ? HEADER
            BlocBuilder<BasePageBloc, BaseEntityPageState>(
              builder: (BuildContext context, BaseEntityPageState state) {
                return ColoredBox(
                  color: context.theme.colorScheme.surfaceVariant,
                  child: Padding(
                    padding: const EdgeInsets.only(left: kPadding, right: kPadding),
                    child: KitViewHeader(
                      children: [
                        /// ? BACK BUTTON
                        Padding(
                          padding: const EdgeInsets.only(right: kPaddingLarge),
                          child: KitIconButton(
                            icon: IconPack.flu_chevron_left_filled,
                            onPressed: () => context.navigator.pop(),
                          ),
                        ),

                        /// ? TITLE
                        Text(
                          'Editing $helper',
                          style: context.theme.textTheme.headline6,
                        ),
                        const Spacer(),
                        if (kDebugMode) KitDivider.horizontal(kPadding),

                        /// ? SYNC BUTTON
                        BlocBuilder<EditorBloc, EditorState>(
                          builder: (BuildContext context, EditorState state) {
                            final bool synced = state.isSyncedWithFile;

                            return KitTooltip(
                              text: synced ? 'Cancel file sync' : 'Sync editor with filesystem for getting more power',
                              child: KitButton(
                                color: synced ? context.theme.colorScheme.error : null,
                                onPressed: synced ? context.read<EditorBloc>().closeSync : context.read<EditorBloc>().syncWithFile,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(synced ? 'Cancel' : 'Sync'),
                                    Padding(
                                      padding: const EdgeInsets.only(left: kPaddingSmall),
                                      child: Icon(
                                        synced ? IconPack.flu_arrow_sync_checkmark_filled : IconPack.flu_arrow_sync_circle_filled,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        KitDivider.horizontal(kPadding),

                        /// ? JSON VIEW BUTTON
                        KitButton(
                          color: isPageJsonAvailable ? context.theme.colorScheme.tertiary : null,
                          onPressed: toggleJsonView,
                          child: Row(
                            children: [
                              Text(isPageJsonAvailable ? 'Screen code' : 'Page data'),
                              Padding(
                                padding: const EdgeInsets.only(left: kPaddingSmall),
                                child: Icon(
                                  isPageJsonAvailable ? IconPack.mdi_file_xml_box : IconPack.mdi_code_json,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        KitDivider.horizontal(kPadding),

                        /// ? ICONS BUTTON
                        KitButton(
                          onPressed: () async => selectIcon(context: context, query: '', selectedIcon: null),
                          child: Row(
                            children: const [
                              Text('Icons'),
                              Padding(
                                padding: EdgeInsets.only(left: kPaddingSmall),
                                child: Icon(
                                  IconPack.flu_image_search_filled,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        KitDivider.horizontal(kPadding),

                        /// ? HELP / MANUAL BUTTON
                        KitContainerTransition(
                          useRootNavigator: true,
                          openBuilder: manualBuilder,
                          closedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                          closedColor: context.theme.colorScheme.surfaceVariant,
                          middleColor: context.theme.colorScheme.surfaceVariant,
                          closedBuilder: (BuildContext context, VoidCallback action) => KitButton(
                            onPressed: action,
                            child: Row(
                              children: const [
                                Text('Help'),
                                Padding(
                                  padding: EdgeInsets.only(left: kPaddingSmall),
                                  child: Icon(
                                    IconPack.flu_chat_help_filled,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            /// ? BODY
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: kPaddingLarge),
                child: KitViewContainer(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: kPadding,
                            bottom: kPadding,
                          ),
                          child: isPageJsonAvailable
                              ? BlocBuilder<BasePageBloc, BaseEntityPageState>(
                                  builder: (BuildContext context, BaseEntityPageState state) {
                                    return PageDataPreview(
                                      data: state.data,
                                      field: field,
                                    );
                                  },
                                )
                              : PageEditor(codeFieldKey: context.read<EditorBloc>().codeFieldKey),
                        ),
                      ),
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
      ),
    );
  }
}
