import 'dart:async';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

import '../../logic/field/field.dart';
import '../../logic/multi_selector_field/multi_selector_field.dart';
import '../../logic/multi_selector_field/third_table.dart';
import '../../logic/selector_field/title_fields.dart';
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
  bool isPreloading = false;

  @override
  PageBloc get pageBloc {
    if (super.pageBloc is PageBloc) {
      return super.pageBloc as PageBloc;
    }
    throw Exception('Not found $PageBloc in the widget tree');
  }

  String? get parentModelId {
    final String? modelId = context.vRouter.pathParameters[Params.modelId.name];
    if (modelId == null) {
      notFoundEntityIdError();
    }
    final Model? parentModel = context.read<ModelListBloc>().findModelById(modelId);
    if (parentModel == null) {
      notFoundModelError(modelId);
    }
    final dynamic parentModelId = context.read<BasePageBloc>().valueForKey(parentModel.idField.id);
    if (parentModelId == null) {
      return null;
      // return newRelationsId(parentModel);
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
      showMessageNotification('To select related pages, generate an ID for the current page first.');
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
    if (mounted) {
      controller.text = kLoadingText;
      safeSetState(() => isPreloading = true);
      final CollectionResponseDto childrenEntities = await context.read<ICollectionProvider>().fetchPageList(
            model: model,
            subset: [
              model.idField.id,
              ...titleFields.toFieldsIds(),
            ],
            query: QueryOrField(
              fields: [
                ...(await getSelectedIds()).map(
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
              limit: 50,
              sort: Sort(field: model.idField.id, order: Order.asc),
            ),
          );
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
      }
      unawaited(updateVirtualField());
    }
  }

  Future<void> saveEventHandler(Model entity) => preload();

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
          limit: selectedIds.length,
          sort: Sort(field: model.idField.id, order: Order.asc),
        ),
      );
      pageBloc.updateValue(virtualField, result.data);
    }
  }

  @override
  void initState() {
    super.initState();
    eventBus.onEvent(consumer: eventBusId, eventId: PageEvents.save, handler: saveEventHandler);
  }

  @override
  void dispose() {
    eventBus.unsubscribeFromEvent(consumer: eventBusId, eventId: PageEvents.save);
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
      showShimmer: isPreloading,
      child: KitButtonFieldWrapper(
        onPressed: selectFields,
        child: KitSegmentedField(
          validator: groupOfValidators([
            if (field.isRequired) isRequiredValidator,
          ]),
          focusStream: focusStream,
          helper: helper,
          controller: controller,
          children: [
            Stack(
              children: [
                KitTextField(
                  placeholder: placeholder,
                  controller: TextEditingController(),
                  decoration: context.kitDecorations.noneDecoration(context).copyWith(hintText: placeholder),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: titleChips.isEmpty ? 0 : 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: titleChips.length,
                    itemBuilder: titleChipBuilder,
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
