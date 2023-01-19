import 'dart:async';

import 'package:cms/cms.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/multi_selector_field/multi_selector_field.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:fields/src/domain/fields/ui/multi_selector_field_cell/multi_selector_modal.dart';
import 'package:fields/src/domain/fields/ui/selector_field_cell/selector_field_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class MultiSelectorArrayOfObjectsFieldCell extends FieldCellWidget<MultiSelectorField> {
  const MultiSelectorArrayOfObjectsFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<MultiSelectorArrayOfObjectsFieldCell> createState() => _MultiSelectorArrayOfObjectsFieldCellState();
}

class _MultiSelectorArrayOfObjectsFieldCellState extends State<MultiSelectorArrayOfObjectsFieldCell>
    with FieldCellHelper<MultiSelectorField, MultiSelectorArrayOfObjectsFieldCell> {
  final FocusNode focusNode = FocusNode();

  String get eventBusId => [
        runtimeType.toString(),
        model.id,
        model.idField.id,
        ...titleFields,
        structure.name,
      ].join();

  List<String> get titleFields => field.titleFields;

  Model get model => field.model;

  MultiSelectorFieldStructure get structure => field.structure;
  late final EventBus eventBus = context.read();

  bool isPreloading = false;

  List<String> getSelectedIds() {
    final List<Json> childrenIds = (pageBloc.valueForKey(fieldId) as List<dynamic>? ?? <Json>[]).map(castToJson).toList();
    return childrenIds.map((Json it) => it[model.idField.id].toString()).toList();
  }

  Future<void> selectFields() async {
    focusNode.requestFocus();
    final List<String>? result = await showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) => MultiSelectorModal(
        field: field,
        selectedIds: getSelectedIds(),
      ),
      barrierDismissible: false,
    );
    if (result != null && mounted) {
      controller.text = kLoadingText;
      setState(() => isPreloading = true);
      final List<Json> selectedObjects = await context.read<PageListProviderInterface>().fetchPageList(
            model: model,
            subset: model.flattenFields.map((Field field) => field.id).toList(),
            params: ParamsDto(
              page: 1,
              limit: result.length,
              sort: Sort(field: model.idField.id, order: Order.asc),
            ),
            query: QueryDto(
              multipleValues: [
                QueryMultipleParameter(
                  name: model.idField.id,
                  values: result.map((String id) => QueryStringValue(id)).toList(),
                ),
              ],
            ),
          );
      final String resultTitle = selectedObjects.map(
        (Json row) {
          final String title = titleFields.map((String it) => row[it].toString()).join(kDelimiter);
          return titleFields.length > 1 ? '[$title]' : title;
        },
      ).join(kDelimiter);
      controller.text = resultTitle;
      pageBloc.updateValue(fieldId, selectedObjects);
      setState(() => isPreloading = false);
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
              ...titleFields,
            ],
            params: ParamsDto(
              page: 1,
              limit: 50,
              sort: Sort(field: model.idField.id, order: Order.asc),
            ),
            query: QueryDto(
              multipleValues: [
                QueryMultipleParameter(
                  name: model.idField.id,
                  values: getSelectedIds().map((String id) => QueryStringValue(id)).toList(),
                ),
              ],
            ),
          );
      final String resultTitle = childrenEntities.map(
        (Json row) {
          final String title = titleFields.map((String it) => row[it].toString()).join(kDelimiter);
          return titleFields.length > 1 ? '[$title]' : title;
        },
      ).join(kDelimiter);
      controller.text = resultTitle;
      if (mounted) {
        setState(() => isPreloading = false);
      }
    }
  }

  Future<void> saveEventHandler(Model entity) async => preload();

  @override
  void initState() {
    super.initState();
    unawaited(preload());
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
          isChanged: pageBloc.fieldWasChanged(fieldId),
          focusNode: focusNode,
          isRequired: field.isRequired,
        ),
      ),
    );
  }
}
