import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui/nui.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/config/config.dart';
import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../document/logic/bloc/base_document_bloc/base_page_state.dart';
import '../../../field/logic/fields/screen_field/screen_content_model.dart';
import '../../../field/logic/fields/screen_field/screen_field.dart';
import '../../../field/ui/field_cell_mixin.dart';
import '../../../preview/logic/bloc/preview_bloc.dart';
import '../../../preview/ui/component/page_preview_with_frame.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_button.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_icon_button.dart';
import '../../../ui_kit/domain/ui/components/kit_column.dart';
import '../../../ui_kit/domain/ui/components/kit_container_transition.dart';
import '../../../ui_kit/domain/ui/components/kit_divider.dart';
import '../../../ui_kit/domain/ui/components/kit_icons/kit_icon_selector_modal.dart';
import '../../../ui_kit/domain/ui/components/kit_screen_preloader.dart';
import '../../../ui_kit/domain/ui/components/kit_text.dart';
import '../../../ui_kit/domain/ui/components/kit_tooltip.dart';
import '../../../ui_kit/domain/ui/components/kit_view/kit_view_container.dart';
import '../../../ui_kit/domain/ui/components/kit_view/kit_view_header.dart';
import '../../logic/bloc/editor/editor_bloc.dart';
import '../../logic/bloc/editor/editor_state.dart';
import '../component/page_editor.dart';
import 'page_data_preview.dart';
import 'tags_manual_view.dart';

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
  late final EditorBloc manualBloc = EditorBloc(eventBus: localEventBus);
  late final PreviewBloc previewBloc = PreviewBloc(eventBus: localEventBus);
  final GlobalKey<KitScreenPreloaderState> preloaderKey = GlobalKey();
  late final EditorBloc editorBloc = context.read();
  final DataStorage dataStorage = DataStorage();
  bool isPageJsonAvailable = false;

  void toggleJsonView() => safeSetState(() => isPageJsonAvailable = !isPageJsonAvailable);

  Widget manualBuilder(BuildContext context, CloseContainerActionCallback<String> action) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditorBloc>.value(value: manualBloc),
        BlocProvider<PreviewBloc>.value(value: previewBloc),
      ],
      child: const TagsManualView(),
    );
  }

  void updateBinaryForm(String xml) {
    if (field.binaryDataFieldId != null && field.binaryDataFieldId!.isNotEmpty) {
      final Uint8List? binaryForm = TagsConverter.toBinaryFromXml(xml);
      pageBloc.updateValue(
        field.binaryDataFieldId!,
        binaryForm?.toList(growable: false),
      );
    }
  }

  Future<void> onScreenContentChange(EditorState state) async {
    pageBloc.updateValue(
      fieldId,
      ScreenContentModel(
        content: state.xmlContent,
        contentType: field.screenContentType,
      ).toJson(),
    );
    updateBinaryForm(state.xmlContent);
  }

  Future<void> preload() async {
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
      key: preloaderKey,
      delayBeforeBuildChild: const Duration(milliseconds: 510),
      builder: (_) => ColoredBox(
        color: context.theme.colorScheme.surfaceVariant,
        child: KitColumn(
          children: [
            /// ? HEADER
            BlocBuilder<BaseDocumentBloc, BaseDocumentState>(
              builder: (BuildContext context, BaseDocumentState state) {
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
                            onPressed: () async {
                              final NavigatorState navigator = context.navigator;
                              await preloaderKey.currentState?.disablePreloadedScreen();
                              navigator.pop();
                            },
                          ),
                        ),

                        /// ? TITLE
                        KitText(
                          text: 'Editing $helper',
                          style: context.theme.textTheme.titleLarge,
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
                                    KitText(text: synced ? 'Cancel' : 'Sync'),
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
                              KitText(text: isPageJsonAvailable ? 'Screen code' : 'Page data'),
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
                          child: const Row(
                            children: [
                              KitText(text: 'Icons'),
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
                            child: const Row(
                              children: [
                                KitText(text: 'Help'),
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
                              ? BlocBuilder<BaseDocumentBloc, BaseDocumentState>(
                                  builder: (BuildContext context, BaseDocumentState state) {
                                    return PageDataPreview(
                                      data: state.data,
                                      field: field,
                                    );
                                  },
                                )
                              : PageEditor(codeFieldKey: context.read<EditorBloc>().codeFieldKey),
                        ),
                      ),
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
      ),
    );
  }
}
