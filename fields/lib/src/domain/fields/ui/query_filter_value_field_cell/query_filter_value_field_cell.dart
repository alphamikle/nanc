import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

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
  late final CollectionFilterBloc collectionFilterBloc = context.read();
  Json get data => localPageBloc.state.data;
  Model get collectionModel => collectionFilterBloc.state.collectionModel;
  bool isPreloading = false;

  List<EnumValue> get conditionTypes {
    return [
      QueryFieldType.equals.toEnum(),
      QueryFieldType.notEquals.toEnum(),
      QueryFieldType.startsWith.toEnum(),
      QueryFieldType.notStartsWith.toEnum(),
      QueryFieldType.endsWith.toEnum(),
      QueryFieldType.notEndsWith.toEnum(),
      QueryFieldType.contains.toEnum(),
      QueryFieldType.notContains.toEnum(),
      QueryFieldType.empty.toEnum(),
      QueryFieldType.notEmpty.toEnum(),
      QueryFieldType.less.toEnum(),
      QueryFieldType.lessOrEquals.toEnum(),
      QueryFieldType.greater.toEnum(),
      QueryFieldType.greaterOrEquals.toEnum(),
      QueryFieldType.isTrue.toEnum(),
      QueryFieldType.isFalse.toEnum(),
      QueryFieldType.isNull.toEnum(),
      QueryFieldType.isNotNull.toEnum(),
    ];
  }

  List<EnumValue> get modelFields {
    return collectionModel.flattenFields.map((Field field) => EnumValue(title: field.name, value: field.id)).toList();
  }

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
      localPageBloc.initFromJson(json);
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

  void onFieldIdSelect(EnumValue? value) {
    if (value != null && (localPageBloc.valueForKey(QueryValueField.fieldIdKey) != value.value || isPreloading)) {
      localPageBloc.updateValue(QueryValueField.fieldIdKey, value.value);
      localPageBloc.controllerFor(QueryValueField.fieldIdKey).text = value.title;
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
                  return Row(
                    children: [
                      Expanded(
                        child: KitEnumField(
                          controller: bloc.controllerFor(QueryValueField.fieldIdKey),
                          selected: findSelectedField(),
                          values: modelFields,
                          onSelect: onFieldIdSelect,
                          helper: 'Field ID',
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
                          helper: 'Condition',
                          placeholder: 'Select condition',
                          isChanged: bloc.fieldWasChanged(QueryField.typeKey),
                          isRequired: true,
                        ),
                      ),
                      const KitDivider(width: Gap.regular),
                      Expanded(
                        child: KitTextField(
                          placeholder: 'Write here',
                          helper: 'Value',
                          onChanged: (String newValue) => bloc.updateValue(QueryValueField.valueKey, newValue),
                          maxLines: 1,
                          isChanged: bloc.fieldWasChanged(QueryValueField.valueKey),
                          controller: bloc.controllerFor(QueryValueField.valueKey),
                        ),
                      ),
                      // const KitDivider(width: Gap.regular),
                    ],
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

extension QueryFieldTypeToEnumValue on QueryFieldType {
  EnumValue toEnum() {
    return EnumValue(title: title, value: name);
  }
}
