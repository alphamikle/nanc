import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:nanc/nanc.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../service/tools/field_types_extension.dart';
import '../../logic/enum_field/enum_value.dart';
import '../../logic/field/field.dart';
import '../../logic/query_filter_value_field/query_filter_value_field.dart';
import '../field_cell_mixin.dart';

class QueryFilterValueFieldCell extends FieldCellWidget<QueryFilterValueField> {
  const QueryFilterValueFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<QueryFilterValueFieldCell> createState() => _QueryFilterValueFieldCellState();
}

int i = 0;

class _QueryFilterValueFieldCellState extends State<QueryFilterValueFieldCell> with FieldCellHelper<QueryFilterValueField, QueryFilterValueFieldCell> {
  late final LocalPageBloc localPageBloc = LocalPageBloc(draftService: context.read(), onDataChanged: onDataChanged);
  late final CollectionBloc collectionFilterBloc = context.read();
  late final Set<QueryFieldType> supportedFilters = context.read<DataRepository>().supportedFilters;

  Json get data => localPageBloc.state.data;

  Model get collectionModel => collectionFilterBloc.state.model;

  Field? get selectedField {
    final String? fieldId = localPageBloc.valueForKey(QueryValueField.fieldIdKey);
    if (fieldId == null) {
      return null;
    }
    return collectionModel.flattenFields.firstWhereOrNull((Field field) => field.id == fieldId);
  }

  QueryFieldType? get selectedCondition {
    final String? conditionName = localPageBloc.valueForKey(QueryField.typeKey);
    if (conditionName == null) {
      return null;
    }
    return QueryFieldType.valueTypes.firstWhereOrNull((QueryFieldType type) => type.name == conditionName);
  }

  bool get isStringField => selectedField?.isString ?? false;

  bool get isNumericField => selectedField?.isNumeric ?? false;

  bool get isDateTimeField => selectedField?.isDateTime ?? false;

  bool get isBoolField => selectedField?.isBool ?? false;

  bool get needToShowValueField {
    if (isBoolField) {
      return false;
    }
    if (selectedCondition?.needToShowValueField == false) {
      return false;
    }
    return true;
  }

  List<EnumValue> get conditionTypes {
    final Set<QueryFieldType> sf = supportedFilters;

    return [
      if (sf.withEquals && (isStringField || isNumericField || isDateTimeField)) QueryFieldType.equals.toEnum(),
      if (sf.withNotEquals && (isStringField || isNumericField || isDateTimeField)) QueryFieldType.notEquals.toEnum(),
      if (sf.withStartsWith && (isStringField || isDateTimeField)) QueryFieldType.startsWith.toEnum(),
      if (sf.withNotStartsWith && (isStringField || isDateTimeField)) QueryFieldType.notStartsWith.toEnum(),
      if (sf.withEndsWith && (isStringField || isDateTimeField)) QueryFieldType.endsWith.toEnum(),
      if (sf.withNotEndsWith && (isStringField || isDateTimeField)) QueryFieldType.notEndsWith.toEnum(),
      if (sf.withContains && (isStringField || isDateTimeField)) QueryFieldType.contains.toEnum(),
      if (sf.withNotContains && (isStringField || isDateTimeField)) QueryFieldType.notContains.toEnum(),
      if (sf.withEmpty && (isStringField || isDateTimeField)) QueryFieldType.empty.toEnum(),
      if (sf.withNotEmpty && (isStringField || isDateTimeField)) QueryFieldType.notEmpty.toEnum(),
      if (sf.withLess && (isNumericField || isDateTimeField)) QueryFieldType.less.toEnum(),
      if (sf.withLessOrEquals && (isNumericField || isDateTimeField)) QueryFieldType.lessOrEquals.toEnum(),
      if (sf.withGreater && (isNumericField || isDateTimeField)) QueryFieldType.greater.toEnum(),
      if (sf.withGreaterOrEquals && (isNumericField || isDateTimeField)) QueryFieldType.greaterOrEquals.toEnum(),
      if (sf.withIsTrue && isBoolField) QueryFieldType.isTrue.toEnum(),
      if (sf.withIsFalse && isBoolField) QueryFieldType.isFalse.toEnum(),
      if (sf.withIsNull) QueryFieldType.isNull.toEnum(),
      if (sf.withIsNotNull) QueryFieldType.isNotNull.toEnum(),
    ];
  }

  List<EnumValue> get modelFields {
    return collectionModel.flattenFields.map((Field field) => EnumValue(title: field.name, value: field.id)).toList();
  }

  bool isPreloading = false;

  void onDataChanged(Json data) {
    if (isPreloading) {
      return;
    }
    pageBloc.updateValue(fieldId, data);
  }

  void preload() {
    isPreloading = true;
    final DJson? rawJson = pageBloc.valueForKey(fieldId);
    if (rawJson != null) {
      final Json json = castToJson(rawJson);
      localPageBloc.updateValues(json);
      onFieldIdSelect(findSelectedField());
      onConditionSelect(findSelectedCondition());
      final Object? value = localPageBloc.valueForKey(QueryValueField.valueKey);
      if (value != null) {
        localPageBloc.controllerFor(QueryValueField.valueKey).text = value.toString();
      }
    }
    isPreloading = false;
  }

  void onConditionSelect(EnumValue? value) {
    if (value != null && (localPageBloc.valueForKey(QueryField.typeKey) != value.value || isPreloading)) {
      localPageBloc.updateValue(QueryField.typeKey, value.value);
      localPageBloc.controllerFor(QueryField.typeKey).text = value.title;
    }
  }

  void fixIncorrectConditions(Field? prevField) {
    const String key = QueryField.typeKey;
    final TextEditingController controller = localPageBloc.controllerFor(key);
    final Object? value = localPageBloc.valueForKey(QueryValueField.valueKey);
    final TextEditingController valueController = localPageBloc.controllerFor(QueryValueField.valueKey);

    void updateValue(Object? value) {
      localPageBloc.updateValue(QueryValueField.valueKey, value);
    }

    void resetValue() {
      updateValue(null);
      valueController.text = '';
    }

    void resetCondition() {
      localPageBloc.updateValue(key, null);
      controller.text = '';
      resetValue();
    }

    if (selectedCondition != null) {
      if (selectedField == null) {
        resetCondition();
      } else if (isStringField && (selectedCondition!.isNumericOnlyType || selectedCondition!.isBoolOnlyType)) {
        resetCondition();
      } else if (isNumericField && (selectedCondition!.isStringOnlyType || selectedCondition!.isBoolOnlyType)) {
        resetCondition();
      } else if (isBoolField &&
          (selectedCondition!.isStringOnlyType || selectedCondition!.isNumericOnlyType || selectedCondition!.isCommonType == false) &&
          selectedCondition!.isBoolOnlyType == false) {
        resetCondition();
      }
    }
    if ((value != null || valueController.text.isNotEmpty) && needToShowValueField == false) {
      resetValue();
    }
    if (prevField != null) {
      if (prevField.isNumeric && isStringField) {
        updateValue(value.toString());
      } else if (prevField.isString && isNumericField) {
        final num? number = num.tryParse(value.toString());
        updateValue(number);
        valueController.text = number == null ? '' : number.toString();
      }
    }
  }

  void onFieldIdSelect(EnumValue? value) {
    final Field? prevField = selectedField;
    const String key = QueryValueField.fieldIdKey;

    if (value != null && (localPageBloc.valueForKey(key) != value.value || isPreloading)) {
      localPageBloc.updateValue(key, value.value);
      localPageBloc.controllerFor(key).text = value.title;
      fixIncorrectConditions(prevField);
    }
  }

  EnumValue? findSelectedField() {
    final Object? value = localPageBloc.valueForKey(QueryValueField.fieldIdKey);
    if (value == null) {
      return null;
    }
    return modelFields.firstWhereOrNull((EnumValue enumValue) => enumValue.value == value);
  }

  EnumValue? findSelectedCondition() {
    final Object? value = localPageBloc.valueForKey(QueryField.typeKey);
    if (value == null) {
      return null;
    }
    return conditionTypes.firstWhereOrNull((EnumValue enumValue) => enumValue.value == value);
  }

  Widget buildValueField() {
    final LocalPageBloc bloc = localPageBloc;
    final String helper = 'Value${needToShowValueField ? ' (required)' : ''}';

    return BlocBuilder<CollectionBloc, CollectionState>(
      builder: (BuildContext context, CollectionState state) {
        final bool isChanged = bloc.fieldWasChanged(QueryValueField.valueKey);
        final TextEditingController controller = bloc.controllerFor(QueryValueField.valueKey);

        if (isNumericField) {
          return KitNumberField(
            controller: controller,
            helper: helper,
            placeholder: 'Type number here',
            onChanged: (Object? newValue) => bloc.updateValue(QueryValueField.valueKey, newValue),
            isChanged: isChanged,
            isRequired: needToShowValueField || true,
          );
        }
        if (isDateTimeField) {
          // TODO(alphamikle): Use implemented KitDateTimeField
        }
        return KitTextField(
          controller: controller,
          helper: helper,
          placeholder: 'Write here',
          onChanged: (String newValue) => bloc.updateValue(QueryValueField.valueKey, newValue),
          maxLines: 1,
          isChanged: isChanged,
          isRequired: needToShowValueField || true,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    preload();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BaseDocumentBloc<BaseDocumentState>>.value(
      value: localPageBloc,
      child: Builder(
        builder: (BuildContext context) {
          final BaseDocumentBloc bloc = context.read();

          return BlocBuilder<CollectionBloc, CollectionState>(
            builder: (BuildContext context, CollectionState collectionBloc) {
              return BlocBuilder<BaseDocumentBloc, BaseDocumentState>(
                builder: (BuildContext context, BaseDocumentState state) {
                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      final double widthPerField = (constraints.maxWidth - (Gap.regular * 2)) / 3;

                      return Row(
                        children: [
                          Expanded(
                            child: KitEnumField(
                              controller: bloc.controllerFor(QueryValueField.fieldIdKey),
                              selected: findSelectedField(),
                              values: modelFields,
                              onSelect: onFieldIdSelect,
                              helper: 'Field ID (required)',
                              placeholder: 'Select field',
                              isChanged: bloc.fieldWasChanged(QueryValueField.fieldIdKey),
                              isRequired: true,
                            ),
                          ),
                          const KitDivider(width: Gap.regular),
                          Expanded(
                            child: KitEnumField(
                              controller: bloc.controllerFor(QueryField.typeKey),
                              selected: findSelectedCondition(),
                              values: conditionTypes,
                              onSelect: onConditionSelect,
                              helper: 'Condition (required)',
                              placeholder: 'Select condition',
                              isChanged: bloc.fieldWasChanged(QueryField.typeKey),
                              isRequired: true,
                            ),
                          ),
                          AnimatedSize(
                            curve: Curves.easeOutQuad,
                            duration: const Duration(milliseconds: 250),
                            child: KitDivider(width: needToShowValueField ? Gap.regular : 0),
                          ),
                          AnimatedContainer(
                            curve: Curves.easeOutQuad,
                            duration: const Duration(milliseconds: 350),
                            width: needToShowValueField ? widthPerField : 0,
                            child: AnimatedOpacity(
                              curve: Curves.easeOutQuad,
                              duration: const Duration(milliseconds: 300),
                              opacity: needToShowValueField ? 1 : 0,
                              child: buildValueField(),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

extension ExtendedQueryFieldType on QueryFieldType {
  EnumValue toEnum() => EnumValue(title: title, value: name);

  bool get isNumericOnlyType {
    return QueryFieldType.onlyNumericTypes.contains(this);
  }

  bool get isStringOnlyType {
    return QueryFieldType.onlyStringTypes.contains(this);
  }

  bool get isBoolOnlyType {
    return QueryFieldType.onlyBoolTypes.contains(this);
  }

  bool get isCommonType {
    return QueryFieldType.commonTypes.contains(this);
  }
}

extension ExtendedSupportedFilters on Iterable<QueryFieldType> {
  bool get withOr => contains(QueryFieldType.or);
  bool get withAnd => contains(QueryFieldType.and);
  bool get withEquals => contains(QueryFieldType.equals);
  bool get withNotEquals => contains(QueryFieldType.notEquals);
  bool get withStartsWith => contains(QueryFieldType.startsWith);
  bool get withNotStartsWith => contains(QueryFieldType.notStartsWith);
  bool get withEndsWith => contains(QueryFieldType.endsWith);
  bool get withNotEndsWith => contains(QueryFieldType.notEndsWith);
  bool get withContains => contains(QueryFieldType.contains);
  bool get withNotContains => contains(QueryFieldType.notContains);
  bool get withEmpty => contains(QueryFieldType.empty);
  bool get withNotEmpty => contains(QueryFieldType.notEmpty);
  bool get withLess => contains(QueryFieldType.less);
  bool get withLessOrEquals => contains(QueryFieldType.lessOrEquals);
  bool get withGreater => contains(QueryFieldType.greater);
  bool get withGreaterOrEquals => contains(QueryFieldType.greaterOrEquals);
  bool get withIsTrue => contains(QueryFieldType.isTrue);
  bool get withIsFalse => contains(QueryFieldType.isFalse);
  bool get withIsNull => contains(QueryFieldType.isNull);
  bool get withIsNotNull => contains(QueryFieldType.isNotNull);
}
