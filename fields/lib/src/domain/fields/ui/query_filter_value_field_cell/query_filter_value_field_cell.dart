import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../../fields.dart';

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
  late final CollectionFilterBloc collectionFilterBloc = context.read();

  Json get data => localPageBloc.state.data;

  Model get collectionModel => collectionFilterBloc.state.collectionModel;

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
    return [
      if (isStringField || isNumericField || isDateTimeField) QueryFieldType.equals.toEnum(),
      if (isStringField || isNumericField || isDateTimeField) QueryFieldType.notEquals.toEnum(),
      if (isStringField || isDateTimeField) QueryFieldType.startsWith.toEnum(),
      if (isStringField || isDateTimeField) QueryFieldType.notStartsWith.toEnum(),
      if (isStringField || isDateTimeField) QueryFieldType.endsWith.toEnum(),
      if (isStringField || isDateTimeField) QueryFieldType.notEndsWith.toEnum(),
      if (isStringField || isDateTimeField) QueryFieldType.contains.toEnum(),
      if (isStringField || isDateTimeField) QueryFieldType.notContains.toEnum(),
      if (isStringField || isDateTimeField) QueryFieldType.empty.toEnum(),
      if (isStringField || isDateTimeField) QueryFieldType.notEmpty.toEnum(),
      if (isNumericField || isDateTimeField) QueryFieldType.less.toEnum(),
      if (isNumericField || isDateTimeField) QueryFieldType.lessOrEquals.toEnum(),
      if (isNumericField || isDateTimeField) QueryFieldType.greater.toEnum(),
      if (isNumericField || isDateTimeField) QueryFieldType.greaterOrEquals.toEnum(),
      if (isBoolField) QueryFieldType.isTrue.toEnum(),
      if (isBoolField) QueryFieldType.isFalse.toEnum(),
      QueryFieldType.isNull.toEnum(),
      QueryFieldType.isNotNull.toEnum(),
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

    return BlocBuilder<CollectionFilterBloc, CollectionFilterState>(
      builder: (BuildContext context, CollectionFilterState state) {
        final bool isChanged = bloc.fieldWasChanged(QueryValueField.valueKey);
        final TextEditingController controller = bloc.controllerFor(QueryValueField.valueKey);

        if (isNumericField) {
          return KitNumberField(
            controller: controller,
            helper: helper,
            placeholder: 'Type number here',
            onChanged: (num? newValue) => bloc.updateValue(QueryValueField.valueKey, newValue),
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
    return BlocProvider<BasePageBloc<BaseEntityPageState>>.value(
      value: localPageBloc,
      child: Builder(
        builder: (BuildContext context) {
          final BasePageBloc bloc = context.read();

          return BlocBuilder<CollectionFilterBloc, CollectionFilterState>(
            builder: (BuildContext context, CollectionFilterState filterState) {
              return BlocBuilder<BasePageBloc, BaseEntityPageState>(
                builder: (BuildContext context, BaseEntityPageState state) {
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
