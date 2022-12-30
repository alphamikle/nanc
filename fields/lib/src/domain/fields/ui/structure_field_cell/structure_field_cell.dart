import 'dart:async';

import 'package:cms/cms.dart';
import 'package:fields/src/domain/fields/logic/dynamic_field/dynamic_field_item.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/structure_field/structure_field.dart';
import 'package:fields/src/domain/fields/ui/dynamic_field_cell/child_indicator.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:fields/src/domain/fields/ui/structure_field_cell/structure_field_child.dart';
import 'package:fields/src/domain/mapper/field_mapper.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class StructureFieldCell extends FieldCellWidget<StructureField> {
  const StructureFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<StructureFieldCell> createState() => _StructureFieldCellState();
}

class _StructureFieldCellState extends State<StructureFieldCell> with FieldCellHelper<StructureField, StructureFieldCell> {
  late final List<DynamicFieldItem> childrenData = [];
  bool isPreloading = false;

  Color get indicatorParentColor => (context.theme.colorScheme.primary).withOpacity(1);
  Color get indicatorChildColor => indicatorParentColor;

  List<Json> get childrenFieldsJson {
    return childrenData.map((DynamicFieldItem item) => item.field.toJson()).toList();
  }

  Future<void> addItem() async {
    final FieldType? fieldType = await showFieldTypeSelectorModal(
      context,
      exclude: {
        FieldType.dynamicField,
        FieldType.screenField,
        FieldType.structureField,
        FieldType.structuredField,
      },
    );
    Field? field;
    if (mounted && fieldType != null) {
      field = await showFieldCreationModal(context, fieldType);
    }
    if (field != null) {
      setState(() {
        final DynamicFieldItem childData = DynamicFieldItem.fromField(field!);
        childrenData.add(childData);
        onChildChange(childData.value, childrenData.length - 1);

        pageBloc.updateValue(fieldId, childrenFieldsJson);
      });
    }
  }

  void onChildChange(Object? value, int? index) {
    if (index != null) {
      final DynamicFieldItem oldItem = childrenData[index];
      childrenData[index] = DynamicFieldItem(controller: oldItem.controller, value: value, field: oldItem.field, children: oldItem.children);
    }
    setState(() {});
    pageBloc.updateValue(fieldId, childrenFieldsJson);
  }

  void onChangeChildStructure(List<DynamicFieldItem> childrenItems, int index) {
    childrenData[index] = childrenData[index].copyWith(children: [...childrenItems]);
    pageBloc.updateValues(<String, dynamic>{
      fieldId: childrenFieldsJson,
    });
  }

  void switchItems(int firstItemIndex, int secondItemIndex) {
    final List<DynamicFieldItem> newChildrenData = [...childrenData];
    final DynamicFieldItem firstItem = newChildrenData[firstItemIndex];
    final DynamicFieldItem secondItem = newChildrenData[secondItemIndex];
    newChildrenData[firstItemIndex] = secondItem;
    newChildrenData[secondItemIndex] = firstItem;
    childrenData.clear();
    childrenData.addAll(newChildrenData);

    /// ? Update
    onChildChange(firstItem.value, secondItemIndex);
    onChildChange(secondItem.value, firstItemIndex);
  }

  Future<void> deleteItem(int index) async {
    final String itemFieldName = childrenData[index].field.name;
    final bool isConfirmed = await confirmAction(context: context, title: 'Are you sure, that you want to delete "$itemFieldName"?');
    if (isConfirmed) {
      childrenData.removeAt(index);
      onChildChange(null, null);
    }
  }

  Future<void> editItem(int index) async {
    final Field itemField = childrenData[index].field;
    final Field? editedField = await showFieldEditorModal(
      context: context,
      model: itemField.toModel(),
      field: itemField,
    );
    if (editedField != null) {
      childrenData[index] = childrenData[index].copyWith(field: editedField);
      onChildChange(childrenData[index].value, index);
    }
  }

  Widget childrenBuilder(BuildContext context, int index) {
    final DynamicFieldItem item = childrenData[index];
    final BasePageBloc entityPageBloc = ListFieldBloc(
      onEdit: (String fieldId, Object? value) => onChildChange(value, index),
      item: item,
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
              child: StructureFieldChild(
                item: item.field,
                onMoveUp: index == 0 ? null : () => switchItems(index, index - 1),
                onMoveDown: isLast ? null : () => switchItems(index, index + 1),
                onEdit: () async => editItem(index),
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
        final Json structure = castToJson(values[i]);
        final Field field = FieldMapper.jsonToField(structure);
        final DynamicFieldItem item = DynamicFieldItem.fromField(field);
        childrenData.add(item);
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
    final ThemeData theme = context.theme;
    final IconData? contentIcon = tryToGetIconByName(field.contentIcon);
    final Color? contentColor = field.contentColor;

    return KitEmptyInput(
      color: contentColor,
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
                Text(helper, style: theme.textTheme.subtitle1),
                const Spacer(),
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
