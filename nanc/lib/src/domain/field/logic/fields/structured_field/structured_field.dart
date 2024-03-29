import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../tools/json_factories.dart';
import '../../type/field_types.dart';
import '../bool_field/bool_field.dart';
import '../dynamic_field/dynamic_field.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';
import '../structure_field/structure_field.dart';

part 'structured_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class StructuredField extends DynamicField {
  StructuredField({
    required super.name,
    required this.structure,
    this.singleObject = false,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.contentIcon,
    super.contentColor,
    super.type = FieldType.structuredField,
  }) : super(id: id ?? toSnakeCase(name));

  factory StructuredField.empty() => StructuredField(id: '', name: '', structure: const []);

  factory StructuredField.fromJson(dynamic json) => _$StructuredFieldFromJson(castToJson(json));

  @JsonKey(fromJson: fieldsFromJsonRow, toJson: fieldsToJsonRow, defaultValue: <Field>[])
  final List<Field> structure;

  final bool singleObject;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_code_block_regular,
      color: Color.fromRGBO(31, 60, 166, 1),
      title: 'Structured field',
      description: 'A field for storing a list of objects (or single object) with a predefined structure',
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
          fieldToModelSort,
        ],
        [
          fieldToModelShowInList,
          fieldToModelIsRequired,
          BoolField(id: 'singleObject', name: 'Store one object only?'),
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
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == StructuredField.empty();
}
