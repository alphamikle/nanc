import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../fields.dart';

part 'multi_selector_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class MultiSelectorField extends Field {
  MultiSelectorField({
    required super.name,
    required this.model,
    required this.titleFields,
    required this.thirdTable,
    String? virtualField,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.multiSelectorField,
  })  : virtualField = virtualField ?? '\$${id ?? toSnakeCase(name)}',
        super(id: id ?? toSnakeCase(name));

  factory MultiSelectorField.empty() => MultiSelectorField(
        id: '',
        name: '',
        model: IdField.empty().toModel(),
        titleFields: const [],
        thirdTable: ThirdTable.empty(),
      );

  factory MultiSelectorField.fromJson(dynamic json) => _$MultiSelectorFieldFromJson(castToJson(json));

  final String virtualField;
  final Model model;

  @JsonKey(fromJson: titleFieldsFromJson, toJson: titleFieldsToJson)
  final List<TitleField> titleFields;

  final ThirdTable thirdTable;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_order_bool_ascending_variant,
      color: Color.fromRGBO(9, 96, 19, 1),
      title: 'Multi-selector field',
      description: 'A field that allows selecting a set of values from the linked model. Full analog of the SQL-relationships "many-to-one"',
    );
  }

  @override
  Json toJson() => _$MultiSelectorFieldToJson(this);

  @override
  Model toModel() {
    final Model entity = super.toModel();
    return entity.copyWith(
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
          fieldToModelVirtualField,
        ],
        [
          fieldToModelModel,
        ],
        [
          StructuredField(
            id: fieldTitleFieldsProperty,
            name: 'Related model fields',
            structure: [
              EnumField(
                id: fieldTypeProperty,
                name: 'Type',
                isRequired: true,
                values: [
                  EnumValue(title: 'Field', value: TitleFieldType.externalField.name),
                  EnumValue(title: 'Divider', value: TitleFieldType.fieldsDivider.name),
                  EnumValue(title: 'Decorator', value: TitleFieldType.fieldsDecorator.name),
                ],
              ),
              StringField(id: fieldValueProperty, name: 'Value', isRequired: true),
            ],
          ),
        ],
        [
          StructuredField(
            id: fieldThirdTableProperty,
            name: 'Third table',
            singleObject: true,
            structure: [
              ModelsSelectorField(
                id: 'relationsEntity',
                name: 'Relations model',
                isRequired: true,
              ),
              StringField(id: 'parentEntityIdName', name: 'Parent Model ID', isRequired: true),
              StringField(id: 'childEntityIdName', name: 'Child Model ID', isRequired: true),
            ],
          ),
        ],
        [
          fieldToModelSort,
          fieldToModelWidth,
        ],
        [
          fieldToModelShowInList,
          fieldToModelIsRequired,
        ],
        // TODO(alphamikle): Make code field
        // [
        //   if (Env.isRealCMS) fieldToModelValidator,
        // ],
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == MultiSelectorField.empty();
}
