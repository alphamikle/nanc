import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_model/nanc_model.dart';
import 'package:tools/tools.dart';

import '../../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';

part 'models_selector_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class ModelsSelectorField extends Field {
  ModelsSelectorField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.type = FieldType.modelsSelectorField,
  }) : super(id: id ?? toSnakeCase(name));

  factory ModelsSelectorField.empty() => ModelsSelectorField(
        id: '',
        name: '',
      );

  factory ModelsSelectorField.fromJson(dynamic json) => _$ModelsSelectorFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_floor_plan,
      color: Color.fromRGBO(89, 52, 79, 1),
      title: 'Models Selector Field',
      description: 'A field that allows you to select a model from your models\' list',
    );
  }

  @override
  Json toJson() => _$ModelsSelectorFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.mdi_floor_plan,
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          fieldToModelSort,
          fieldToModelShowInList,
          fieldToModelIsRequired,
        ],
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == ModelsSelectorField.empty();
}
