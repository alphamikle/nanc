import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/errors/human_exception.dart';
import '../../../document/logic/bloc/document_bloc/document_bloc.dart';
import '../../../model/logic/model/logic/model.dart';
import '../../../ui_kit/domain/ui/components/kit_circle_preloader.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_autocomplete_text_field.dart';
import '../../../ui_kit/domain/ui/components/kit_list_tile.dart';
import '../../../ui_kit/domain/ui/components/kit_shimmer_switcher.dart';
import '../../../ui_kit/domain/ui/components/kit_tooltip.dart';
import '../../../ui_kit/domain/ui/theme/kit_colors.dart';
import '../../logic/fields/selector_field/selector_field.dart';
import '../../logic/fields/selector_field/title_fields.dart';
import '../../logic/tools/complex_title_tools.dart';
import '../field_cell_mixin.dart';

const String kLoadingText = 'Loading...';

class SelectorFieldCell extends FieldCellWidget<SelectorField> {
  const SelectorFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<SelectorFieldCell> createState() => _SelectorFieldCellState();
}

class _SelectorFieldCellState extends State<SelectorFieldCell> with FieldCellHelper<SelectorField, SelectorFieldCell> {
  String get eventBusId => [
        runtimeType.toString(),
        model.id,
        model.idField.id,
        ...titleFields.toFieldsIds(),
      ].join();

  String get virtualField => widget.field.virtualField;

  List<TitleField> get titleFields => field.titleFields;

  Model get model => field.model;
  late final EventBus eventBus = read();
  bool isPreloading = false;
  final StreamController<bool> isLoadingFullPageData = StreamController.broadcast();
  bool isError = false;

  Future<List<Json>> finder(String searchQuery) async {
    isLoadingFullPageData.add(true);
    try {
      final ICollectionProvider entityListProvider = read();
      final List<String> values = splitComplexTitle(
        query: searchQuery,
        titleFields: field.titleFields,
      ).where((String value) => value.trim().isNotEmpty).toList();
      final List<QueryValueField> queryValues = [];
      final List<String> titleFieldsIds = field.titleFields.toFieldsIds();

      for (final String titleFieldId in titleFieldsIds) {
        for (final String value in values) {
          queryValues.add(
            QueryValueField(
              fieldId: titleFieldId,
              value: value,
              type: QueryFieldType.contains,
            ),
          );
        }
      }

      final CollectionResponseDto result = await entityListProvider.fetchPageList(
        model: model,
        subset: [
          model.idField.id,
          ...titleFields.toFieldsIds(),
        ],
        query: QueryOrField(fields: queryValues),
        params: ParamsDto(
          page: 1,
          limit: 50,
          sort: Sort(
            fieldId: model.idField.id,
            order: Order.asc,
          ),
        ),
      );
      if (isError) {
        safeSetState(() => isError = false);
      }
      isLoadingFullPageData.add(false);
      return result.data;
    } catch (error) {
      isLoadingFullPageData.add(false);
      safeSetState(() {
        isPreloading = false;
        isError = true;
      });
      throw error.toHumanException('Related data loading failed!');
    }
  }

  Future<void> updateValue(Json json) async {
    final String pageId = json[field.model.idField.id].toString();
    final List<String> titleSegments = titleFields.toTitleSegments(json);
    final String title = titleSegments.join();
    pageBloc.updateValue(fieldId, pageId);
    controller.text = title;
    unawaited(updateVirtualField(pageId));
  }

  Widget itemBuilder(BuildContext context, Json data) {
    bool isSelected = false;
    final dynamic dataId = data[field.model.idField.id];
    final dynamic value = pageBloc.valueForKey(fieldId);
    if (value != null) {
      isSelected = value == dataId;
    }

    final String title = titleFields.toTitleSegments(data).join();

    return KitListTile(
      title: title,
      isSelected: isSelected,
    );
  }

  Future<void> saveEventHandler(Model entity) async {
    if (mounted) {
      await preload();
    }
  }

  Future<void> preload() async {
    safeSetState(() => isPreloading = true);
    try {
      controller.text = kLoadingText;
      final String? pageId = pageBloc.valueForKey(fieldId) as String?;
      if (pageId == null) {
        controller.clear();
        safeSetState(() => isPreloading = false);
        return;
      }
      final Json data = await read<IDocumentProvider>().fetchDocument(
        model: model,
        documentId: pageId,
        subset: [
          model.idField.id,
          ...titleFields.toFieldsIds(),
        ],
      );
      final String title = titleFields.toTitleSegments(data).join();
      controller.text = title;
      if (mounted) {
        safeSetState(() => isPreloading = false);
        unawaited(updateVirtualField(pageId));
      }
    } catch (error) {
      safeSetState(() {
        isPreloading = false;
        isError = true;
      });
      throw error.toHumanException('Related data loading failed!');
    }
  }

  Future<void> updateVirtualField(String pageId) async {
    isLoadingFullPageData.add(true);
    try {
      final Json? data = await safeRead<DocumentBloc>()?.loadPageData(model: model, documentId: pageId);
      safeRead<DocumentBloc>()?.updateValue(virtualField, data);
      isLoadingFullPageData.add(false);
    } catch (error) {
      isLoadingFullPageData.add(false);
      throw error.toHumanException('Virtual field data loading failed!');
    }
  }

  Future<void> clearField() async {
    controller.text = '';
    safeRead<DocumentBloc>()?.updateValue(fieldId, null);
    safeRead<DocumentBloc>()?.updateValue(virtualField, null);
  }

  @override
  void initState() {
    super.initState();
    unawaited(preload());
    eventBus.onEvent(consumer: eventBusId, eventId: DocumentEvent.documentChanged, handler: saveEventHandler);
  }

  @override
  void dispose() {
    eventBus.unsubscribeFromEvent(consumer: eventBusId, eventId: DocumentEvent.documentChanged);
    unawaited(isLoadingFullPageData.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        KitShimmerSwitcher(
          showShimmer: isPreloading || isError,
          color: isError ? context.theme.colorScheme.error.o50 : null,
          child: KitAutocompleteTextField(
            controller: controller,
            finder: finder,
            placeholder: 'Write something to search...',
            helper: helper,
            onSelect: updateValue,
            itemBuilder: itemBuilder,
            isChanged: pageBloc.fieldWasChanged(fieldId),
            isRequired: field.isRequired,
            suffix: StreamBuilder(
              initialData: false,
              stream: isLoadingFullPageData.stream,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) => KitCirclePreloader(
                isLoading: snapshot.data ?? false,
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 4,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: StreamBuilder(
              stream: isLoadingFullPageData.stream,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return snapshot.data ?? false || isPreloading
                    ? const SizedBox.shrink()
                    : KitTooltip(
                        text: 'Clear field',
                        child: IconButton(
                          color: context.theme.colorScheme.primary,
                          onPressed: clearField,
                          icon: const Icon(IconPack.mdi_delete_sweep_outline),
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
