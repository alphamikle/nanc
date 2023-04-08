import 'dart:async';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../type/field_types.dart';
import '../../logic/dynamic_field/dynamic_field.dart';
import '../../logic/dynamic_field/dynamic_field_item.dart';
import '../../logic/dynamic_field/structure_model.dart';
import '../../logic/field/field.dart';
import '../field_cell_mixin.dart';
import 'child_indicator.dart';
import 'dynamic_field_child.dart';

class DynamicFieldCell extends FieldCellWidget<DynamicField> {
  const DynamicFieldCell({
    required super.field,
    required super.creationMode,
    this.deepLevel = 0,
    this.onChangeChildStructure,
    this.initialChildrenData = const [],
    super.key,
  }) : assert(deepLevel > 0 && onChangeChildStructure != null || deepLevel == 0);

  final int deepLevel;
  final ValueChanged<List<DynamicFieldItem>>? onChangeChildStructure;
  final List<DynamicFieldItem> initialChildrenData;

  @override
  State<DynamicFieldCell> createState() => _DynamicFieldCellState();
}

class _DynamicFieldCellState extends State<DynamicFieldCell> with FieldCellHelper<DynamicField, DynamicFieldCell> {
  String get structureFieldId => generateStructureFieldId(fieldId);

  int get deepLevel => widget.deepLevel;

  bool get isParentList => deepLevel == 0;

  bool get isChildList => deepLevel > 0;
  late final List<DynamicFieldItem> childrenData = [...widget.initialChildrenData];
  bool isPreloading = false;
  bool isEditMode = false;

  Color get indicatorParentColor => (context.theme.colorScheme.primary).withOpacity(1);

  Color get indicatorChildColor => indicatorParentColor;

  List<Json> get childrenDataJson {
    return childrenData.map((DynamicFieldItem item) => item.valueObject).toList();
  }

  List<Json> get childrenFieldsJson {
    return childrenData.map((DynamicFieldItem item) => item.structureObject).toList();
  }

  void toggleEditMode() => safeSetState(() => isEditMode = !isEditMode);

  Future<void> addItem() async {
    final FieldType? fieldType = await showFieldTypeSelectorModal(context);
    Field? field;
    if (mounted && fieldType != null) {
      field = await showFieldCreationModal(context, fieldType);
    }
    if (field != null) {
      safeSetState(() {
        final DynamicFieldItem childData = DynamicFieldItem.fromField(field!);
        childrenData.add(childData);
        onChildChange(childData.value, childrenData.length - 1);
      });
    }
  }

  void onChildChange(Object? value, int? index) {
    if (index != null) {
      final DynamicFieldItem oldItem = childrenData[index];
      childrenData[index] = DynamicFieldItem(controller: oldItem.controller, value: value, field: oldItem.field, children: oldItem.children);
    }
    if (isParentList) {
      pageBloc.updateValues(<String, dynamic>{
        fieldId: childrenDataJson,
        structureFieldId: childrenFieldsJson,
      });
    } else {
      pageBloc.updateValue(fieldId, childrenDataJson);
      widget.onChangeChildStructure!(childrenData);
    }
  }

  void onChangeChildStructure(List<DynamicFieldItem> childrenItems, int index) {
    childrenData[index] = childrenData[index].copyWith(children: [...childrenItems]);
    if (isChildList) {
      widget.onChangeChildStructure!(childrenData);
    } else {
      pageBloc.updateValues(<String, dynamic>{
        fieldId: childrenDataJson,
        structureFieldId: childrenFieldsJson,
      });
    }
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
              child: DynamicFieldChild(
                item: item,
                creationMode: creationMode,
                deepLevel: deepLevel + 1,
                onChangeChildStructure: (List<DynamicFieldItem> children) => onChangeChildStructure(children, index),
                initialChildrenData: item.children,
                editMode: isEditMode,
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
    safeSetState(() => isPreloading = true);
    final dynamic values = pageBloc.valueForKey(fieldId);
    final dynamic structures = pageBloc.valueForKey(generateStructureFieldId(fieldId));
    if (values is List<dynamic> && structures is List<dynamic>) {
      for (int i = 0; i < values.length; i++) {
        final dynamic value = castToJson(values[i]).values.first;
        final Json structure = castToJson(structures[i]);
        structure[DynamicFieldItem.valuePropName] = value;
        final DynamicFieldItem item = DynamicFieldItem.fromJson(structure);
        childrenData.add(item);
      }
    } else if (values is List<dynamic> && childrenData.isNotEmpty) {
      for (int i = 0; i < childrenData.length; i++) {
        final Json valueObject = castToJson(values[i]);
        final dynamic value = valueObject.values.first;
        final DynamicFieldItem item = childrenData[i];
        if (isScalar(value)) {
          item.controller.text = value.toString();
        }
        childrenData[i] = item.copyWith(value: value);
      }
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
