import 'dart:async';

import 'package:fields/src/domain/fields/logic/multi_selector_field/multi_selector_field.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:fields/src/domain/fields/ui/multi_selector_field_cell/multi_selector_modal.dart';
import 'package:fields/src/domain/fields/ui/selector_field_cell/selector_field_cell.dart';
import 'package:flutter/material.dart';
import 'package:cms/cms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class MultiSelectorArrayOfIdsFieldCell extends FieldCellWidget<MultiSelectorField> {
  const MultiSelectorArrayOfIdsFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<MultiSelectorArrayOfIdsFieldCell> createState() => _MultiSelectorFieldCellState();
}

class _MultiSelectorFieldCellState extends State<MultiSelectorArrayOfIdsFieldCell> with FieldCellHelper<MultiSelectorField, MultiSelectorArrayOfIdsFieldCell> {
  final FocusNode focusNode = FocusNode();

  String get titleField => field.titleField;
  Model get entity => field.model;
  MultiSelectorFieldStructure get structure => field.structure;
  late final EventBus eventBus = context.read();

  bool isPreloading = false;

  List<String> getSelectedIds() {
    final List<String> childrenIds = (pageBloc.valueForKey(fieldId) as List<dynamic>? ?? <String>[]).cast();
    return childrenIds;
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
    if (result != null) {
      pageBloc.updateValue(fieldId, result);
      await preload();
    }
  }

  Future<void> preload() async {
    if (mounted) {
      controller.text = kLoadingText;
      setState(() => isPreloading = true);
      final List<Json> childrenEntities = await context.read<PageListProviderInterface>().fetchPageList(
            model: entity,
            subset: [
              entity.idField.id,
              titleField,
            ],
            params: ParamsDto(
              page: 1,
              limit: 50,
              sort: Sort(field: entity.idField.id, order: Order.asc),
            ),
            query: QueryDto(
              multipleValues: [
                QueryMultipleParameter(
                  name: entity.idField.id,
                  values: getSelectedIds().map((String id) => QueryStringValue(id)).toList(),
                ),
              ],
            ),
          );
      final String resultTitle = childrenEntities.map((Json row) => row[titleField].toString()).join(kDelimiter);
      controller.text = resultTitle;
      if (mounted) {
        setState(() => isPreloading = false);
      }
    }
  }

  Future<void> saveEventHandler(Model entity) => preload();

  @override
  void initState() {
    super.initState();
    unawaited(preload());
    eventBus.onEvent(consumer: runtimeType.toString(), eventId: PageEvents.save, handler: saveEventHandler);
  }

  @override
  void dispose() {
    eventBus.unsubscribeFromEvent(consumer: runtimeType.toString(), eventId: PageEvents.save);
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
