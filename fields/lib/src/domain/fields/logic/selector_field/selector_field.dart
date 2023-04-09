import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../fields.dart';

part 'selector_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class SelectorField extends Field {
  SelectorField({
    required super.name,
    required this.model,
    required this.titleFields,
    String? virtualField,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.selectorField,
  })  : virtualField = virtualField ?? '\$${id ?? toSnakeCase(name)}',
        super(id: id ?? toSnakeCase(name));

  factory SelectorField.empty() => SelectorField(
        id: '',
        name: '',
        model: IdField.empty().toModel(),
        titleFields: const [],
      );

  factory SelectorField.fromJson(dynamic json) => _$SelectorFieldFromJson(castToJson(json));

  final String virtualField;
  final Model model;

  @JsonKey(fromJson: titleFieldsFromJson, toJson: titleFieldsToJson)
  final List<TitleField> titleFields;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_order_bool_descending,
      color: Color.fromRGBO(255, 42, 13, 1),
      title: 'Selector field',
      description: 'A field that allows you to select a value from a linked model. It is the analog of the SQL "one-to-many" relation',
    );
  }

  @override
  Json toJson() => _$SelectorFieldToJson(this);

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
          fieldToModelSort,
          fieldToModelWidth,
        ],
        [
          fieldToModelShowInList,
          fieldToModelIsRequired,
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
          // TODO(alphamikle): Make code field
          // if (Env.isRealCMS) fieldToModelValidator,
        ],
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == SelectorField.empty();
}
