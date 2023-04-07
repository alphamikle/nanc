import 'dart:async';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../logic/dynamic_field/dynamic_field_item.dart';
import '../../logic/dynamic_field/structure_model.dart';
import '../../logic/field/field.dart';
import '../../logic/structured_field/structured_field.dart';
import '../dynamic_field_cell/child_indicator.dart';
import '../field_cell_mixin.dart';
import 'structured_field_child.dart';
import 'structured_field_item.dart';

class StructuredFieldCell extends FieldCellWidget<StructuredField> {
  const StructuredFieldCell({
    required super.field,
    required super.creationMode,
    this.deepLevel = 0,
    this.onChildChange,
    this.initialChildrenData = const [],
    super.key,
  });

  final int deepLevel;
  final ValueChanged<List<StructuredFieldItem>>? onChildChange;
  final List<StructuredFieldItem> initialChildrenData;

  @override
  State<StructuredFieldCell> createState() => _StructuredFieldCellState();
}

class _StructuredFieldCellState extends State<StructuredFieldCell> with FieldCellHelper<StructuredField, StructuredFieldCell> {
  Key childrenKey = UniqueKey();
  String get structureFieldId => generateStructureFieldId(fieldId);
  int get deepLevel => widget.deepLevel;
  bool get isParentList => deepLevel == 0;
  bool get isChildList => deepLevel > 0;
  late final List<StructuredFieldItem> childrenData = [...widget.initialChildrenData];
  bool isPreloading = false;
  bool isEditMode = false;

  Color get indicatorParentColor => (context.theme.colorScheme.primary).withOpacity(1);
  Color get indicatorChildColor => indicatorParentColor;

  List<Json> get childrenDataJson {
    final List<Json> result = [];
    for (final StructuredFieldItem structuredItem in childrenData) {
      final Json itemData = <String, dynamic>{};
      for (final DynamicFieldItem dynamicItem in structuredItem.items) {
        itemData[dynamicItem.field.id] = dynamicItem.value;
      }
      result.add(itemData);
    }
    return result;
  }

  void toggleEditMode() {
    setState(() => isEditMode = !isEditMode);
  }

  Future<void> addItem() async {
    final StructuredFieldItem structuredItem = StructuredFieldItem(items: field.structure.map((Field field) => DynamicFieldItem.fromField(field)).toList());
    childrenData.add(structuredItem);
    onChildChange();
  }

  void refreshChildrenKey() => childrenKey = UniqueKey();

  void onChildChange({String? fieldId, Object? value, int? index}) {
    if (fieldId != null && index != null) {
      final StructuredFieldItem oldItem = childrenData[index];
      final List<DynamicFieldItem> dynamicItems = [...oldItem.items];
      final int targetItemIndex = dynamicItems.indexWhere((DynamicFieldItem it) => it.field.id == fieldId);
      if (targetItemIndex >= 0) {
        final DynamicFieldItem oldDynamicItem = dynamicItems[targetItemIndex];
        final DynamicFieldItem newDynamicItem = DynamicFieldItem(
          controller: oldDynamicItem.controller
            ..value = TextEditingValue(text: (value == null ? '' : value.toString()), selection: oldDynamicItem.controller.selection),
          value: value,
          field: oldDynamicItem.field,
        );
        dynamicItems[targetItemIndex] = newDynamicItem;
        childrenData[index] = oldItem.copyWith(
          items: dynamicItems,
        );
      }
    }
    if (widget.onChildChange != null) {
      widget.onChildChange!(childrenData);
    }
    pageBloc.updateValue(this.fieldId, childrenDataJson);
  }

  // void _onChildChange(int index, List<StructuredFieldItem> items) {
  //   logg('_onChildChange: $index / $items');
  // }

  void switchItems(int firstItemIndex, int secondItemIndex) {
    final List<StructuredFieldItem> newChildrenData = [...childrenData];
    final StructuredFieldItem firstItem = newChildrenData[firstItemIndex];
    final StructuredFieldItem secondItem = newChildrenData[secondItemIndex];
    newChildrenData[firstItemIndex] = secondItem;
    newChildrenData[secondItemIndex] = firstItem;
    childrenData.clear();
    childrenData.addAll(newChildrenData);

    /// ? Update
    onChildChange();
    setState(() {});
    refreshChildrenKey();
  }

  Future<void> deleteItem(int index) async {
    final bool isConfirmed = await confirmAction(context: context, title: 'Are you sure, that you want to delete this item?');
    if (isConfirmed) {
      childrenData.removeAt(index);
      onChildChange();
      refreshChildrenKey();
    }
  }

  Widget childrenBuilder(BuildContext context, int index) {
    final StructuredFieldItem item = childrenData[index];
    final BasePageBloc entityPageBloc = ListFieldBloc(
      structuredItem: item,
      onEdit: (String fieldId, Object? value) => onChildChange(fieldId: fieldId, value: value, index: index),
      draftService: context.read(),
    );
    final bool isLast = index == childrenData.length - 1;
    IndicatorPosition position = IndicatorPosition.middle;
    if (isLast) {
      position = IndicatorPosition.last;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: Gap.large),
      child: BlocProvider.value(
        value: entityPageBloc,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 15,
              child: ChildIndicator(
                parentColor: indicatorParentColor,
                childColor: indicatorChildColor,
                position: position,
                middleBottomFixer: Gap.large,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: StructuredFieldChild(
                item: item,
                creationMode: creationMode,
                deepLevel: deepLevel + 1,
                initialChildrenData: item,
                editMode: isEditMode,
                // onChildChange: (List<StructuredFieldItem> items) => _onChildChange(index, items),
                onMoveUp: index == 0 ? null : () => switchItems(index, index - 1),
                onMoveDown: isLast ? null : () => switchItems(index, index + 1),
                onDelete: () async => deleteItem(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> preload() async {
    setState(() => isPreloading = true);
    final dynamic values = pageBloc.valueForKey(fieldId);
    if (values is List<dynamic>) {
      for (int i = 0; i < values.length; i++) {
        final Object? value = values[i];
        final StructuredFieldItem structuredItem = StructuredFieldItem.fromValues(value, field.structure);
        childrenData.add(structuredItem);
      }
    }
    setState(() => isPreloading = false);
  }

  @override
  void initState() {
    super.initState();
    unawaited(preload());
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor = KitSegmentedFieldUI.generateBorderColor(
      context: context,
      isChanged: false,
      hasError: false,
      hasFocus: false,
      customColor: field.contentColor,
    );
    final ThemeData theme = context.theme;
    final IconData? contentIcon = tryToGetIconByName(field.contentIcon);
    final Color? contentColor = field.contentColor;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: contentColor == null ? theme.inputDecorationTheme.fillColor : contentColor.o075,
        borderRadius: context.kitBorders.inputRadius,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Gap.regular, top: Gap.large, right: Gap.regular),
            child: Row(
              children: [
                if (contentIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: Gap.regular),
                    child: Icon(contentIcon),
                  ),
                Text(helper, style: theme.textTheme.titleMedium),
                const Spacer(),
                // TODO(alphamikle): FIX LOGIC OR FULLY REWRITE STRUCTURED FIELDS
                Padding(
                  padding: const EdgeInsets.only(right: Gap.regular),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: Gap.small),
                        child: Text('Edit'),
                      ),
                      Switch(
                        onChanged: (_) => toggleEditMode(),
                        value: isEditMode,
                      ),
                    ],
                  ),
                ),
                KitButton(text: 'Add item', onPressed: addItem),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Gap.large),
            child: Row(
              children: [
                SizedBox(
                  height: Gap.large,
                  child: childrenData.isEmpty
                      ? const SizedBox.shrink()
                      : ChildIndicator(
                          parentColor: indicatorParentColor,
                          childColor: indicatorChildColor,
                          position: IndicatorPosition.parent,
                        ),
                ),
              ],
            ),
          ),
          childrenData.isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(left: Gap.large, right: Gap.regular),
                  key: childrenKey,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: childrenBuilder,
                    itemCount: childrenData.length,
                    shrinkWrap: true,
                  ),
                ),
        ],
      ),
    );
  }
}
