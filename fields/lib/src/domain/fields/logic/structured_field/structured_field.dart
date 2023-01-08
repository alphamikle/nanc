import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/src/domain/fields/logic/dynamic_field/dynamic_field.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/fields/logic/field/field_props.dart';
import 'package:fields/src/domain/fields/logic/structure_field/structure_field.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:fields/src/service/tools/json_factories.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'structured_field.g.dart';

@CopyWith()
@JsonSerializable()
class StructuredField extends DynamicField {
  StructuredField({
    required super.name,
    required this.structure,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.contentIcon,
    super.contentColor,
    super.type = FieldType.structuredField,
  }) : super(id: id ?? toSnackCase(name));

  factory StructuredField.empty() => StructuredField(id: '', name: '', structure: const []);

  factory StructuredField.fromJson(dynamic json) => _$StructuredFieldFromJson(castToJson(json));

  @JsonKey(fromJson: fieldsFromJsonRow, toJson: fieldsToJsonRow, defaultValue: <Field>[])
  final List<Field> structure;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_code_block_regular,
      color: Color.fromRGBO(61, 221, 164, 1),
      title: 'Structured field',
      description: 'A field for storing a list of values with a predefined structure',
    );
  }

  @override
  Json toJson() => _$StructuredFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: 'key',
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
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
          fieldToModelContentColor,
          fieldToModelContentIcon,
        ],
        [
          StructureField(id: fieldStructureProperty, name: 'Content structure'),
        ],
      ],
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        structure,
      ];

  @override
  bool get isEmpty => this == StructuredField.empty();
}
