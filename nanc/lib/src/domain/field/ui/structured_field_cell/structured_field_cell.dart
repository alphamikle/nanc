import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_button.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_segmented_field/kit_segmented_field_ui.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/confirm_modal.dart';
import '../../../ui_kit/domain/ui/theme/kit_borders.dart';
import '../../../ui_kit/domain/ui/theme/kit_colors.dart';
import '../../logic/bloc/list_field_bloc/list_field_bloc.dart';
import '../../logic/fields/dynamic_field/dynamic_field_item.dart';
import '../../logic/fields/field/field.dart';
import '../../logic/fields/structured_field/structured_field.dart';
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
  int get deepLevel => widget.deepLevel;
  bool get isParentList => deepLevel == 0;
  bool get isChildList => deepLevel > 0;
  bool get singleObject => field.singleObject;
  bool get multiObject => singleObject == false;
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
    safeSetState(() => isEditMode = !isEditMode);
  }

  Future<void> addItem() async {
    final StructuredFieldItem structuredItem = StructuredFieldItem(
      items: field.structure.map((Field field) => DynamicFieldItem.fromField(field)).toList(),
    );
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
    if (singleObject) {
      pageBloc.updateValue(this.fieldId, childrenDataJson.isEmpty ? <String, dynamic>{} : childrenDataJson.first);
    } else {
      pageBloc.updateValue(this.fieldId, childrenDataJson);
    }
  }

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
    safeSetState();
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
    final BaseDocumentBloc entityPageBloc = ListFieldBloc(
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
      padding: EdgeInsets.only(bottom: singleObject ? Gap.regular : Gap.large),
      child: BlocProvider.value(
        value: entityPageBloc,
        child: Stack(
          children: [
            if (multiObject)
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
              padding: EdgeInsets.only(left: singleObject ? 0 : 15),
              child: StructuredFieldChild(
                item: item,
                creationMode: creationMode,
                deepLevel: deepLevel + 1,
                initialChildrenData: item,
                editMode: isEditMode,
                singleObject: singleObject,
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
    safeSetState(() => isPreloading = true);
    final dynamic values = pageBloc.valueForKey(fieldId);
    if (values is List<dynamic>) {
      for (int i = 0; i < values.length; i++) {
        final Object? value = values[i];
        final StructuredFieldItem structuredItem = StructuredFieldItem.fromValues(value, field.structure);
        childrenData.add(structuredItem);
      }
    } else if (values is Map) {
      final StructuredFieldItem structuredItem = StructuredFieldItem.fromValues(values, field.structure);
      childrenData.add(structuredItem);
    } else if (values == null && singleObject) {
      unawaited(addItem());
    }
    safeSetState(() => isPreloading = false);
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
    final IconData? contentIcon = IconsStorage.tryToGetIconByName(field.contentIcon);
    final Color? contentColor = field.contentColor;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: contentColor == null ? theme.inputDecorationTheme.fillColor : contentColor.o075,
        borderRadius: context.kitBorders.inputRadius,
        border: Border.all(color: borderColor),
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
                if (multiObject)
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
                if (multiObject) KitButton(text: 'Add item', onPressed: addItem),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Gap.large),
            child: Row(
              children: [
                SizedBox(
                  height: Gap.large,
                  child: childrenData.isEmpty || singleObject
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
                  padding: EdgeInsets.only(left: singleObject ? Gap.regular : Gap.large, right: Gap.regular),
                  key: childrenKey,
                  child: SuperListView.builder(
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
