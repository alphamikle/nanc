import 'dart:async';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../../fields.dart';

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
    with FieldCellHelper<MultiSelectorField, MultiSelectorArrayOfObjectsFieldCell>, KitFocusStreamMixin<MultiSelectorArrayOfObjectsFieldCell> {
  String get eventBusId => [
        runtimeType.toString(),
        model.id,
        model.idField.id,
        ...titleFields.toFieldsIds(),
        structure.name,
      ].join();

  List<TitleField> get titleFields => field.titleFields;

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
      titleChips.clear();
      for (final Json child in selectedObjects) {
        final String rowTitle = titleFields.toTitleSegments(child).join();
        titleChips.add(titleToChip(rowTitle));
      }
      if (titleChips.isNotEmpty) {
        controller.text = 'Not empty';
      } else {
        controller.text = '';
      }
      pageBloc.updateValue(fieldId, selectedObjects);
      unawaited(wait(duration: const Duration(milliseconds: 300)).toFuture().then((_) {
        if (mounted) {
          setState(() => isPreloading = false);
        }
      }));
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

      titleChips.clear();
      for (final Json child in childrenEntities) {
        final String rowTitle = titleFields.toTitleSegments(child).join();
        titleChips.add(titleToChip(rowTitle));
      }
      if (titleChips.isNotEmpty) {
        controller.text = 'Not empty';
      } else {
        controller.text = '';
      }
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
