import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/errors/errors.dart';
import '../../../../service/errors/human_exception.dart';
import '../../../../service/notifications/message_notification.dart';
import '../../../../service/routing/params_list.dart';
import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../document/logic/bloc/document_bloc/document_bloc.dart';
import '../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../../model/logic/model/logic/model.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_button_field_wrapper.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_segmented_field/kit_focus_stream_mixin.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_segmented_field/kit_segmented_field.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_text_field.dart';
import '../../../ui_kit/domain/ui/components/kit_shimmer_switcher.dart';
import '../../../ui_kit/domain/ui/theme/kit_colors.dart';
import '../../../ui_kit/domain/ui/theme/kit_input_decorations.dart';
import '../../logic/fields/field/field.dart';
import '../../logic/fields/multi_selector_field/multi_selector_field.dart';
import '../../logic/fields/selector_field/title_fields.dart';
import '../../logic/third_table/third_table.dart';
import '../field_cell_mixin.dart';
import '../selector_field_cell/selector_field_cell.dart';
import 'multi_selector_modal.dart';

class MultiSelectorFieldCell extends FieldCellWidget<MultiSelectorField> {
  const MultiSelectorFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<MultiSelectorFieldCell> createState() => _MultiSelectorFieldCellState();
}

class _MultiSelectorFieldCellState extends State<MultiSelectorFieldCell>
    with FieldCellHelper<MultiSelectorField, MultiSelectorFieldCell>, AfterRender, KitFocusStreamMixin<MultiSelectorFieldCell> {
  String get eventBusId => [
        runtimeType.toString(),
        model.id,
        model.idField.id,
        ...titleFields.toFieldsIds(),
      ].join();

  String get virtualField => widget.field.virtualField;

  List<TitleField> get titleFields => field.titleFields;

  Model get model => field.model;

  ThirdTable get thirdTable => field.thirdTable;
  late final EventBus eventBus = context.read();
  bool isPreloading = true;
  bool isError = false;

  @override
  DocumentBloc get pageBloc {
    if (super.pageBloc is DocumentBloc) {
      return super.pageBloc as DocumentBloc;
    }
    throw Exception('Not found $DocumentBloc in the widget tree');
  }

  String? get parentModelId {
    final String? modelId = context.location.pathParameters[Params.modelId.name];
    if (modelId == null) {
      notFoundModelIdError();
    }
    final Model? parentModel = context.read<ModelListBloc>().tryToFindModelById(modelId);
    if (parentModel == null) {
      notFoundModelError(modelId);
    }
    final dynamic parentModelId = context.read<BaseDocumentBloc>().valueForKey(parentModel.idField.id);
    if (parentModelId == null) {
      return null;
    }
    return parentModelId.toString();
  }

  final List<Widget> titleChips = [];

  Widget titleToChip(String title) {
    return Chip(
      label: Text(title),
      visualDensity: VisualDensity.comfortable,
      backgroundColor: context.theme.colorScheme.primaryContainer.withOpacity(0.5),
      labelStyle: context.theme.textTheme.titleSmall,
      side: BorderSide(color: context.theme.colorScheme.primary.withOpacity(0.5), width: 0.25),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
    );
  }

  Widget titleChipBuilder(BuildContext context, int index) {
    final bool isFirst = index == 0;
    final Widget chip = titleChips[index];
    return Padding(
      padding: EdgeInsets.only(left: isFirst ? Gap.regular : 0, right: Gap.regular),
      child: chip,
    );
  }

  Future<List<String>> getSelectedIds() async {
    if (parentModelId == null) {
      return [];
    }
    final bool hasThirdTableData = pageBloc.hasThirdTableData(thirdTable.relationsEntity.id);
    if (hasThirdTableData) {
      final List<String>? tempThirdTableIds = pageBloc.state.thirdTableData[thirdTable.relationsEntity.id]![parentModelId];
      if (tempThirdTableIds != null) {
        return tempThirdTableIds;
      }
    }

    final CollectionResponseDto thirdTableData = await context.read<ICollectionProvider>().fetchPageList(
          model: thirdTable.relationsEntity,
          subset: [
            thirdTable.relationsEntity.idField.id,
            thirdTable.parentEntityIdName,
            thirdTable.childEntityIdName,
          ],
          query: QueryValueField(
            fieldId: thirdTable.parentEntityIdName,
            value: parentModelId!,
            type: QueryFieldType.equals,
          ),
        );
    return thirdTableData.data.map((Json rowData) => rowData[thirdTable.childEntityIdName].toString()).toList();
  }

  Future<void> selectFields() async {
    focusNode.requestFocus();
    if (parentModelId == null) {
      showMessageNotification(context, 'To select related pages, generate an ID for the current page first.');
      return;
    }
    final List<String> selectedIds = await getSelectedIds();
    if (!mounted) {
      return;
    }
    final List<String>? result = await showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) => MultiSelectorModal(
        field: field,
        selectedIds: selectedIds,
      ),
      barrierDismissible: false,
    );
    if (result != null) {
      pageBloc.updateThirdTableValue(thirdTable, {
        parentModelId!: result,
      });
      await preload();
    }
  }

  Future<void> preload() async {
    try {
      final List<String> selectedIds = await getSelectedIds();
      if (mounted) {
        controller.text = kLoadingText;
        safeSetState(() {
          isPreloading = true;
          isError = false;
        });
        late final CollectionResponseDto childrenEntities;
        if (selectedIds.isEmpty) {
          childrenEntities = const CollectionResponseDto(page: 1, totalPages: 1, data: []);
        } else {
          childrenEntities = await context.read<ICollectionProvider>().fetchPageList(
                model: model,
                subset: [
                  model.idField.id,
                  ...titleFields.toFieldsIds(),
                ],
                query: QueryOrField(
                  fields: [
                    ...selectedIds.map(
                      (String id) => QueryValueField(
                        fieldId: model.idField.id,
                        type: QueryFieldType.equals,
                        value: id,
                      ),
                    ),
                  ],
                ),
                params: ParamsDto(
                  page: 1,
                  limit: NetworkConfig.paginationLimitParameterDefaultValue,
                  sort: Sort(fieldId: model.idField.id, order: Order.asc),
                ),
              );
        }
        titleChips.clear();
        for (final Json child in childrenEntities.data) {
          final String rowTitle = titleFields.toTitleSegments(child).join();
          titleChips.add(titleToChip(rowTitle));
        }
        if (titleChips.isNotEmpty) {
          controller.text = 'Not empty';
        } else {
          controller.text = '';
        }
        if (mounted) {
          safeSetState(() => isPreloading = false);
          unawaited(updateVirtualField());
        }
      }
    } catch (error) {
      safeSetState(() {
        isError = true;
        isPreloading = false;
      });
      throw error.toHumanException('Related data loading failed!');
    }
  }

  Future<void> saveEventHandler(Model entity) async {
    if (mounted) {
      await preload();
    }
  }

  @override
  Future<void> afterRender() async {
    await preload();
  }

  Future<void> updateVirtualField() async {
    final List<String> selectedIds = await getSelectedIds();
    if (mounted) {
      final CollectionResponseDto result = await read<ICollectionProvider>().fetchPageList(
        model: model,
        subset: model.flattenFields.map((Field field) => field.id).toList(),
        query: QueryOrField(
          fields: [
            ...selectedIds.map(
              (String id) => QueryValueField(
                fieldId: model.idField.id,
                type: QueryFieldType.equals,
                value: id,
              ),
            ),
          ],
        ),
        params: ParamsDto(
          page: 1,
          limit: selectedIds.isNotEmpty ? selectedIds.length : 1,
          sort: Sort(fieldId: model.idField.id, order: Order.asc),
        ),
      );
      pageBloc.updateValue(virtualField, result.data);
    }
  }

  @override
  void initState() {
    super.initState();
    eventBus.onEvent(consumer: eventBusId, eventId: DocumentEvent.documentChanged, handler: saveEventHandler);
  }

  @override
  void dispose() {
    eventBus.unsubscribeFromEvent(consumer: eventBusId, eventId: DocumentEvent.documentChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? placeholder = isPreloading
        ? kLoadingText
        : titleChips.isEmpty
            ? 'Tap to choose...'
            : null;

    return KitShimmerSwitcher(
      showShimmer: isPreloading || isError,
      color: isError ? context.theme.colorScheme.error.o50 : null,
      child: KitButtonFieldWrapper(
        onPressed: isError ? preload : selectFields,
        child: KitSegmentedField(
          validator: groupOfValidators([
            if (field.isRequired) isRequiredValidator,
          ]),
          focusStream: focusStream,
          helper: helper,
          controller: isError ? TextEditingController(text: 'Loading error...') : controller,
          children: [
            Stack(
              children: [
                KitTextField(
                  placeholder: placeholder,
                  controller: TextEditingController(),
                  decoration: context.kitDecorations.noneDecoration(context).copyWith(hintText: placeholder),
                ).fixed,
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: titleChips.isEmpty || isError ? 0 : 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: titleChips.length,
                      itemBuilder: titleChipBuilder,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
