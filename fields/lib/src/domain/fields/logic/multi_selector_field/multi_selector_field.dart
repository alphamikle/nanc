import 'package:config/config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/fields/logic/field/field_props.dart';
import 'package:fields/src/domain/fields/logic/id_field/id_field.dart';
import 'package:fields/src/domain/fields/logic/multi_selector_field/third_table.dart';
import 'package:fields/src/domain/fields/logic/string_field/string_field.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'multi_selector_field.g.dart';

enum MultiSelectorFieldStructure {
  arrayOfIds,
  thirdTable,
}

@CopyWith()
@JsonSerializable()
class MultiSelectorField extends Field {
  MultiSelectorField({
    required super.name,
    required this.model,
    required this.titleField,
    required this.structure,
    String? id,
    this.thirdTable,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.multiSelectorField,
  })  : assert(structure == MultiSelectorFieldStructure.thirdTable && thirdTable != null || thirdTable == null),
        super(id: id ?? toSnackCase(name));

  factory MultiSelectorField.empty() => MultiSelectorField(
        id: '',
        name: '',
        model: IdField.empty().toModel(),
        titleField: '',
        structure: MultiSelectorFieldStructure.arrayOfIds,
      );

  factory MultiSelectorField.fromJson(dynamic json) => _$MultiSelectorFieldFromJson(castToJson(json));

  final Model model;
  final String titleField;
  final ThirdTable? thirdTable;
  final MultiSelectorFieldStructure structure;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: MdiIcons.orderBoolAscendingVariant,
      color: Color.fromRGBO(161, 94, 73, 1),
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
        ],
        [
          // TODO(alphamikle): Structure field
          StringField(id: fieldModelProperty, name: 'Model'),
          StringField(id: fieldTitleFieldProperty, name: 'Name of the field with a title from the child object'),
        ],
        [
          // TODO(alphamikle): Structure field
          StringField(id: fieldThirdTableProperty, name: 'Third table'),
          // TODO(alphamikle): Enum field
          StringField(id: fieldStructureProperty, name: 'Type of structure'),
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
          // TODO(alphamikle): Make code field
          if (Env.isRealCMS) fieldToModelValidator,
        ]
      ],
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        model,
        titleField,
        structure,
        thirdTable,
      ];

  @override
  bool get isEmpty => this == MultiSelectorField.empty();
}
