import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../fields.dart';

part 'number_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class NumberField extends Field {
  NumberField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.numberField,
  }) : super(id: id ?? toSnakeCase(name));

  factory NumberField.empty() => NumberField(id: '', name: '');

  factory NumberField.fromJson(dynamic json) => _$NumberFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_numeric,
      color: Color.fromRGBO(133, 153, 71, 1),
      title: 'Number field',
      description: 'Field for entering numbers',
    );
  }

  @override
  Json toJson() => _$NumberFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.mdi_numeric,
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          fieldToModelSort,
          fieldToModelWidth,
          fieldToModelShowInList,
          fieldToModelIsRequired,
        ],
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == NumberField.empty();
}
