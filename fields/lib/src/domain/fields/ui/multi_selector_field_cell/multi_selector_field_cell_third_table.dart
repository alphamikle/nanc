import 'dart:async';

import 'package:cms/cms.dart';
import 'package:fields/src/domain/fields/logic/multi_selector_field/multi_selector_field.dart';
import 'package:fields/src/domain/fields/logic/multi_selector_field/third_table.dart';
import 'package:fields/src/domain/fields/logic/selector_field/title_fields.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:fields/src/domain/fields/ui/multi_selector_field_cell/multi_selector_modal.dart';
import 'package:fields/src/domain/fields/ui/selector_field_cell/selector_field_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

class MultiSelectorThirdTableFieldCell extends FieldCellWidget<MultiSelectorField> {
  const MultiSelectorThirdTableFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<MultiSelectorThirdTableFieldCell> createState() => _MultiSelectorThirdTableFieldCellState();
}

class _MultiSelectorThirdTableFieldCellState extends State<MultiSelectorThirdTableFieldCell>
    with FieldCellHelper<MultiSelectorField, MultiSelectorThirdTableFieldCell>, AfterRender {
  String get eventBusId => [
        runtimeType.toString(),
        model.id,
        model.idField.id,
        ...titleFields.toFieldsIds(),
        structure.name,
      ].join();

  List<TitleField> get titleFields => field.titleFields;
  Model get model => field.model;
  MultiSelectorFieldStructure get structure => field.structure;
  ThirdTable get thirdTable => field.thirdTable!;
  late final EventBus eventBus = context.read();
  bool isPreloading = false;

  @override
  PageBloc get pageBloc {
    if (super.pageBloc is PageBloc) {
      return super.pageBloc as PageBloc;
    }
    throw Exception('Not found $PageBloc in the widget tree');
  }

  String? get parentEntityId {
    final String? entityId = context.vRouter.pathParameters[Params.modelId.name];
    if (entityId == null) {
      notFoundEntityIdError();
    }
    final Model? parentEntity = context.read<ModelListBloc>().findModelById(entityId);
    if (parentEntity == null) {
      notFoundModelError(entityId);
    }
    final dynamic parentEntityId = context.read<BasePageBloc>().valueForKey(parentEntity.idField.id);
    if (parentEntityId == null) {
      return null;
    }
    return parentEntityId.toString();
  }

  Future<List<String>> getSelectedIds() async {
    if (parentEntityId == null) {
      return [];
    }
    final bool hasThirdTableData = pageBloc.hasThirdTableData(thirdTable.relationsEntity.id);
    if (hasThirdTableData) {
      final List<String>? tempThirdTableIds = pageBloc.state.thirdTableData[thirdTable.relationsEntity.id]![parentEntityId];
      if (tempThirdTableIds != null) {
        return tempThirdTableIds;
      }
    }

    final List<Json> thirdTableData = await context.read<PageListProviderInterface>().fetchPageList(
          model: thirdTable.relationsEntity,
          subset: [
            thirdTable.relationsEntity.idField.id,
            thirdTable.parentEntityIdName,
            thirdTable.childEntityIdName,
          ],
          query: QueryDto(
            singleValues: [
              QuerySingleParameter(
                name: thirdTable.parentEntityIdName,
                value: QueryStringValue(parentEntityId!),
              ),
            ],
          ),
        );
    return thirdTableData.map((Json rowData) => rowData[thirdTable.childEntityIdName].toString()).toList();
  }

  Future<void> selectFields() async {
    if (parentEntityId == null) {
      showMessageNotification('You cannot add "${model.name}" entities until you\'ve saved current page');
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
        parentEntityId!: result,
      });
      await preload();
    }
  }

  Future<void> preload() async {
    if (mounted) {
      controller.text = kLoadingText;
      setState(() => isPreloading = true);
      final List<Json> childrenEntities = await context.read<PageListProviderInterface>().fetchPageList(
            model: model,
            subset: [
              model.idField.id,
              ...titleFields.toFieldsIds(),
            ],
            query: QueryDto(
              multipleValues: [
                QueryMultipleParameter(
                  name: model.idField.id,
                  values: (await getSelectedIds()).map((String id) => QueryStringValue(id)).toList(),
                ),
              ],
            ),
            params: ParamsDto(
              page: 1,
              limit: 50,
              sort: Sort(field: model.idField.id, order: Order.asc),
            ),
          );
      final String resultTitle = childrenEntities.map((Json row) => titleFields.toTitleSegments(row).join()).join(' | ');
      controller.text = resultTitle;
      if (mounted) {
        setState(() => isPreloading = false);
      }
    }
  }

  Future<void> saveEventHandler(Model entity) => preload();

  @override
  Future<void> afterRender() async {
    await preload();
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
    return KitShimmerSwitcher(
      showShimmer: isPreloading,
      child: KitButtonFieldWrapper(
        onPressed: selectFields,
        child: KitTextField(
          controller: controller,
          helper: helper,
          placeholder: 'Tap to choose...',
          readOnly: true,
          maxLines: 1,
          isChanged: pageBloc.hasThirdTableData(thirdTable.relationsEntity.id),
          isRequired: field.isRequired,
        ),
      ),
    );
  }
}
